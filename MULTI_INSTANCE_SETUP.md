# InvoicePlane Multi-Instance Setup Guide

This guide explains how to create multiple InvoicePlane instances from this customized setup, including the VAT Display Module and data migration capabilities.

## Overview

This InvoicePlane instance includes:
- Docker containerization with persistent data
- **Portable repository approach** - database data is included in VCS
- Custom VAT Display Module (modular, no core modifications)
- Invoice Ninja to InvoicePlane migration script
- Spanish tax compliance (IVA 21%, proper IRPF handling)
- MariaDB, PHP-FPM, Nginx, and PHPMyAdmin

## Portable Repository Design

**This setup is designed to be fully portable:**
- Database data is stored in `mysql/` directory and committed to VCS
- Complete instance can be cloned to any machine with Docker
- Run `docker-compose up -d` on any new machine and everything works
- All data (clients, invoices, products) travels with the repository
- Perfect for personal/small business use across multiple computers

## Creating a New Instance

### 1. Copy the Project Directory

```bash
# Copy entire project directory
cp -r /path/to/current/invoiceplane /path/to/new/invoiceplane-autonomo

# Navigate to new instance
cd /path/to/new/invoiceplane-autonomo
```

### 2. Update Docker Configuration

#### A. Update docker-compose.yml Port Mappings

Edit `docker-compose.yml` and change all port mappings to avoid conflicts with existing instance:

**Current instance ports (Robot Innocent SL):**
- Web: 2222
- Database: 3306  
- PHPMyAdmin: 8081

**New instance ports (Autonomo):**
```yaml
services:
  nginx:
    ports:
      - "3333:80"  # Change from "2222:80"

  db:
    ports:
      - "3307:3306"  # Change from "3306:3306"

  dbadmin:
    ports:
      - "8082:80"  # Change from "8081:80"
```

#### B. Update Container Names

Update all container names in `docker-compose.yml` to prevent conflicts:

```yaml
services:
  web:
    container_name: autonomo-invoiceplane-web  # Add unique prefix

  nginx:
    container_name: autonomo-invoiceplane-nginx

  db:
    container_name: autonomo-invoiceplane-db

  dbadmin:
    container_name: autonomo-invoiceplane-dbadmin
```

**Complete example docker-compose.yml section:**
```yaml
version: '3.8'
services:
  web:
    container_name: autonomo-invoiceplane-web
    # ... rest of configuration

  nginx:
    container_name: autonomo-invoiceplane-nginx
    ports:
      - "3333:80"
    # ... rest of configuration

  db:
    container_name: autonomo-invoiceplane-db
    ports:
      - "3307:3306"
    # ... rest of configuration
```

### 3. Update Configuration Files

#### A. Update ipconfig.php

Edit `ipconfig.php` and change the base URL to match new port:

```php
// Change this line:
$config['base_url'] = 'http://localhost:2222/';

// To this:
$config['base_url'] = 'http://localhost:3333/';
```

#### B. Update Database Configuration (Optional)

If you want different database names for separation:

```php
// In ipconfig.php, find this section:
$db['default']['database'] = 'invoiceplane';

// Change to:
$db['default']['database'] = 'autonomo_invoiceplane';
```

### 4. Handle Database Data

**This setup includes database data in the repository for portability.**

**Option A: Start with existing data (clone the current setup):**
```bash
# Keep existing mysql/ directory - it contains all migrated data
# Start the new instance with current data
docker-compose up -d

# Verify containers are running without conflicts
docker ps | grep autonomo
```

**Option B: Start fresh (new autonomo instance):**
```bash
# Remove existing database data to start completely fresh
rm -rf mysql/*

# Start the new instance
docker-compose up -d

# Verify containers are running without conflicts
docker ps | grep autonomo
```

### 5. Access New Instance Setup

1. Navigate to `http://localhost:3333`
2. Follow InvoicePlane installation wizard
3. Use database settings:
   - **Host**: `db`
   - **Database**: `invoiceplane` (or custom name from step 3B)
   - **Username**: `invoiceplane`
   - **Password**: `invoiceplane`

### 6. Prepare Invoice Ninja Backup

#### A. Export from Invoice Ninja

1. Login to your Invoice Ninja autonomo account
2. Go to **Settings** → **Import/Export**
3. Click **Export Data**
4. Download the JSON backup file

#### B. Place Backup File

```bash
# Copy your new backup file to the project root
cp /path/to/your/autonomo-backup.json /path/to/new/invoiceplane-autonomo/backup.json
```

### 7. Customize Migration Script

Edit `migrate_data.php` for autonomo-specific tax settings:

**For Autonomo (invoicing companies - IRPF applies):**
```php
// Around line 15-20, find the tax configuration:
$apply_irpf = true;  // Change from false to true for autonomos

// Tax rates for autonomos invoicing companies:
// - IVA: 21% (same)
// - IRPF: 15% retention (applied when invoicing companies)
```

**Complete tax logic for autonomos:**
```php
if ($apply_irpf) {
    // For autonomos invoicing companies
    $invoice_taxes[] = [
        'invoice_id' => $invoice_id,
        'tax_rate_id' => $iva_tax_rate_id,
        'include_item_tax' => 0,
        'tax_rate_name' => 'Impuesto de Valor Añadido',
        'tax_rate_percent' => 21.00
    ];
    
    $invoice_taxes[] = [
        'invoice_id' => $invoice_id,
        'tax_rate_id' => $irpf_tax_rate_id,
        'include_item_tax' => 0,
        'tax_rate_name' => 'IRPF',
        'tax_rate_percent' => -15.00  // Negative for retention
    ];
}
```

### 8. Run Data Migration

```bash
# Access the container
docker exec -it autonomo-invoiceplane-web bash

# Run migration
php migrate_data.php

# Exit container
exit
```

### 9. Verify Setup

1. Access `http://localhost:3333`
2. Login with InvoicePlane admin credentials
3. Verify clients, products, and invoices imported correctly
4. Check VAT Display Module is working (see VAT ID in client addresses)

## VAT Display Module - Upgrade Instructions

If you're upgrading InvoicePlane from source and want to preserve the VAT Display Module:

### Files to Preserve from Current Codebase

**Always copy these directories to new InvoicePlane installation:**
```
application/modules/vat_display/
├── controllers/Vat_display.php
├── helpers/vat_display_helper.php
└── views/invoice_vat_extension.php
```

### Core File Modifications Required

**Only ONE core file needs modification:**

**File**: `application/modules/invoices/views/view.php`

**Add this code at the end of the file (before closing `?>` or at very end):**
```php
<?php 
// VAT Display Module Integration
if (file_exists(APPPATH . 'modules/vat_display/views/invoice_vat_extension.php')) {
    $this->load->view('vat_display/invoice_vat_extension');
}
?>
```

**Exact location to add:** Find the end of the file around line 600+, after the last HTML content and before any closing PHP tags.

### Adding Additional Custom Modules

**To add other custom modules (similar pattern):**

1. **Create module structure:**
```
application/modules/your_module_name/
├── controllers/Your_module_name.php
├── helpers/your_module_name_helper.php
└── views/your_module_extension.php
```

2. **Add integration to appropriate view:**
```php
<?php 
// Your Custom Module Integration
if (file_exists(APPPATH . 'modules/your_module_name/views/your_module_extension.php')) {
    $this->load->view('your_module_name/your_module_extension');
}
?>
```

3. **Integration points for different views:**
   - **Invoices**: `application/modules/invoices/views/view.php`
   - **Clients**: `application/modules/clients/views/view.php`
   - **Quotes**: `application/modules/quotes/views/view.php`
   - **Products**: `application/modules/products/views/view.php`

### Database Requirements

The VAT Display Module uses the built-in `client_vat_id` field. No database modifications required.

### Verifying VAT Module After Upgrade

**Step 1:** Check module files exist
```bash
ls -la application/modules/vat_display/
# Should show:
# controllers/Vat_display.php
# helpers/vat_display_helper.php  
# views/invoice_vat_extension.php
```

**Step 2:** Verify integration code in view file
```bash
tail -10 application/modules/invoices/views/view.php
# Should show the integration code at the end
```

**Step 3:** Test functionality
1. Go to any invoice (e.g., `http://localhost:3333/index.php/invoices/view/1`)
2. Check client address section shows:
   - Address2 VAT: `VAT: X8519084E` (if migrated data)
   - Modular VAT: `NIF/VAT ID: X8519084E` (from VAT Display Module)

**Step 4:** Check browser console for errors
- Open Developer Tools → Console
- Look for "VAT Display Module" messages
- Should not show any JavaScript errors

## Instance Management

### Starting/Stopping Instances

**Start instance:**
```bash
cd /path/to/invoiceplane-instance
docker-compose up -d
```

**Stop instance:**
```bash
cd /path/to/invoiceplane-instance
docker-compose down
```

**View logs:**
```bash
docker-compose logs -f
# Or for specific service:
docker-compose logs -f nginx
```

**Check running containers:**
```bash
docker ps | grep invoiceplane
# Should show both company and autonomo instances
```

### Backup Data

**Database backup:**
```bash
# For Robot Innocent SL instance:
docker exec invoiceplane-db mysqldump -u invoiceplane -pinvoiceplane invoiceplane > backup_company_$(date +%Y%m%d).sql

# For autonomo instance:
docker exec autonomo-invoiceplane-db mysqldump -u invoiceplane -pinvoiceplane invoiceplane > backup_autonomo_$(date +%Y%m%d).sql
```

**Full data backup:**
```bash
tar -czf data_backup_$(date +%Y%m%d).tar.gz data/
```

### Troubleshooting Common Issues

#### 1. Port Conflicts

**Problem:** `Error: bind: address already in use`

**Solution:** Check what's using the ports:
```bash
# Check what's using port 3333:
lsof -i :3333
netstat -tulpn | grep 3333

# If another process is using it, either:
# A) Stop that process, or
# B) Use different ports in docker-compose.yml
```

**Update ports in docker-compose.yml:**
```yaml
nginx:
  ports:
    - "4444:80"  # Use different port
```

#### 2. Container Name Conflicts

**Problem:** `Container name "invoiceplane-db" already exists`

**Solution:** Update all container names in docker-compose.yml:
```yaml
services:
  db:
    container_name: unique-autonomo-invoiceplane-db
  nginx:
    container_name: unique-autonomo-invoiceplane-nginx
```

#### 3. Database Connection Issues

**Problem:** `Database connection failed`

**Solution:** Ensure database container starts first:
```bash
# Check container status:
docker-compose ps

# Restart in correct order:
docker-compose down
docker-compose up -d db
sleep 10
docker-compose up -d
```

#### 4. VAT Module Not Working

**Problem:** No "NIF/VAT ID" showing in invoice view

**Solution A:** Check integration code exists:
```bash
grep -n "vat_display" application/modules/invoices/views/view.php
# Should return the integration lines
```

**Solution B:** Add integration code manually:
```php
// At end of application/modules/invoices/views/view.php:
<?php 
// VAT Display Module Integration
if (file_exists(APPPATH . 'modules/vat_display/views/invoice_vat_extension.php')) {
    $this->load->view('vat_display/invoice_vat_extension');
}
?>
```

**Solution C:** Check AJAX endpoint works:
```bash
# Test direct endpoint (replace with correct client_id):
curl "http://localhost:3333/index.php/vat_display/get_client_vat/89"
# Should return JSON with VAT info
```

#### 5. Migration Script Issues

**Problem:** `Fatal error: Uncaught PDOException`

**Solution:** Ensure database is ready and backup.json exists:
```bash
# Check database is accessible:
docker exec autonomo-invoiceplane-db mysql -u invoiceplane -pinvoiceplane -e "SHOW DATABASES;"

# Check backup.json exists and is valid JSON:
head -20 backup.json
```

## Tax Configuration Notes

### For Companies (like Robot Innocent SL)
- **IVA**: 21% applies to all client invoices
- **IRPF**: Not applied when companies invoice clients
- **Migration setting**: `$apply_irpf = false;`

### For Autonomos
- **IVA**: 21% applies to all invoices  
- **IRPF**: 15% retention applies when invoicing companies
- **Migration setting**: `$apply_irpf = true;` (when invoicing companies)
- **Note**: If autonomo invoices other autonomos, no IRPF applies

## Architecture Summary

This setup provides:
- Multi-instance capability with port isolation
- Modular VAT display requiring only one line of core modification
- Spanish tax compliance for both company and autonomo scenarios
- Complete Invoice Ninja to InvoicePlane migration
- Docker containerization with persistent data storage
- Backup and restoration capabilities

Each instance runs independently with its own database, configuration, and port mappings while sharing the same codebase structure and custom modules.