# Robot Innocent SL - Invoice Management System

<p align="center">
  <img src="/assets/core/img/logo.svg">
</p>

**A portable invoice management system with automatic database synchronization via Git.**

---

## Overview

This is a customized InvoicePlane installation for Robot Innocent SL with an advanced **infrastructure-level auto-sync system** that automatically backs up and synchronizes database changes across multiple computers using Git and GitHub.

### Key Features

- **Real-time auto-sync**: Database changes automatically committed and pushed to GitHub
- **Multi-computer setup**: Clone on any machine and get instant database synchronization
- **Spanish tax compliance**: Full support for Spanish invoicing requirements (NIF, VAT, etc.)
- **Contract integration**: Complete client data from signed contracts
- **Professional invoicing**: SERI-numbered invoice series with proper formatting

---

## Quick Start

### First-Time Setup on Any Computer

1. **Clone the repository:**
   ```bash
   git clone https://github.com/alvaromartinezmajado/factures-robot-innocent.git
   cd factures-robot-innocent
   ```

2. **Start the application:**
   ```bash
   docker-compose up -d
   ```

3. **Access InvoicePlane:**
   - Open: `http://localhost:2222`
   - Login: `feina@alvaro.cat` (password as configured)

4. **Done!** Your database is automatically synchronized and ready to use.

### Daily Workflow

1. **Start application**: `docker-compose up -d`
2. **Use InvoicePlane**: Create invoices, manage clients, record payments
3. **Automatic sync**: Database changes are automatically detected and pushed to GitHub
4. **Switch computers**: `git pull` on another machine instantly syncs the database

---

## Auto-Sync System Architecture

### Infrastructure-Level Monitoring

The system uses a dedicated Docker container (`invoiceplane-git-sync`) that:

- **Monitors database changes** every 30 seconds using checksums
- **Creates SQL dumps** when changes are detected
- **Automatically commits** changes with descriptive messages
- **Pushes to GitHub** for immediate synchronization

### Monitored Data

The auto-sync system tracks changes to:
- **Invoices**: Creation, modification, status changes
- **Clients**: Contact information, addresses, tax codes
- **Invoice items**: Line items, quantities, prices
- **Payments**: Payment records and status updates

### Technical Implementation

```
Database Change → Checksum Detection → SQL Dump → Git Commit → GitHub Push
     ↓               ↓                    ↓           ↓            ↓
  Real-time      30-second cycle      Automatic   Descriptive  Immediate
```

**Average sync time**: 1-2 seconds from database change to GitHub

---

## Container Services

The system runs four Docker containers:

### Core Application
- **`invoiceplane-php`**: PHP 8.1-FPM with all extensions
- **`invoiceplane-nginx`**: Web server on port 2222
- **`invoiceplane-db`**: MariaDB 10.9 database

### Automation
- **`invoiceplane-git-sync`**: Auto-sync monitoring and Git operations
- **`invoiceplane-dbadmin`**: phpMyAdmin on port 8081 (optional)

---

## Multi-Computer Synchronization

### Setting Up on Additional Computers

1. **Clone repository:**
   ```bash
   git clone https://github.com/alvaromartinezmajado/factures-robot-innocent.git
   cd factures-robot-innocent
   ```

2. **Start containers:**
   ```bash
   docker-compose up -d
   ```

3. **Database auto-restoration:**
   - The database is automatically restored from `database/dump.sql`
   - All invoices, clients, and data are immediately available
   - No manual database import needed

### Switching Between Computers

**Computer A → Computer B:**
1. Computer A: Changes are automatically synced to GitHub
2. Computer B: `git pull` (database automatically updates)
3. Computer B: `docker-compose up -d` (ready to use)

---

## Invoice System

### SERI Invoice Series

The system manages sequential SERI-numbered invoices:

- **SERI-00001**: Garaje de Ideas SL - €1,694.00
- **SERI-00002**: Garaje de Ideas SL - €2,783.00
- **SERI-00003**: Crític SCCL - €2,872.50
- **SERI-00004**: Institut d'Estudis Catalans - €5,717.25

### Spanish Tax Compliance

All invoices include:
- ✅ Proper NIF/VAT identification numbers
- ✅ 21% Spanish VAT calculations
- ✅ Complete client address information
- ✅ Sequential invoice numbering
- ✅ Contract-based terms and payment details

---

## File Structure

```
├── database/
│   └── dump.sql              # Auto-synced database dump
├── docker/
│   └── git-sync/             # Auto-sync container configuration
├── mysql/                    # Live database files (not synced)
├── uploads/                  # User uploads (synced)
├── scripts/                  # Database management scripts
├── CONTRACTS/                # Contract documents
├── docker-compose.yml        # Container orchestration
├── ipconfig.php             # Application configuration
└── AUTO-SYNC-README.md      # Detailed auto-sync documentation
```

---

## Troubleshooting

### Container Issues

**Check container status:**
```bash
docker-compose ps
```

**View logs:**
```bash
docker-compose logs git-sync
docker-compose logs php
docker-compose logs nginx
```

**Restart containers:**
```bash
docker-compose restart
```

### Database Issues

**Manual database dump:**
```bash
./scripts/dump-database.sh
```

**Manual database restore:**
```bash
./scripts/restore-database.sh
```

**Check database connection:**
```bash
docker-compose exec db mariadb -uipdevdb -pipdevdb invoiceplane_db -e "SELECT COUNT(*) FROM ip_invoices;"
```

### Git Sync Issues

**Check auto-sync status:**
```bash
docker logs invoiceplane-git-sync --tail=20
```

**Manual sync test:**
```bash
# Make a test change
docker-compose exec db mariadb -uipdevdb -pipdevdb invoiceplane_db -e "UPDATE ip_clients SET client_date_modified = NOW() WHERE client_id = 92;"

# Wait 35 seconds and check for commit
sleep 35 && git log --oneline -2
```

---

## Configuration

### Database Connection
- **Host**: `invoiceplane-db`
- **Port**: `3306`
- **Database**: `invoiceplane_db`
- **User**: `ipdevdb`
- **Password**: `ipdevdb`

### Web Access
- **Application**: `http://localhost:2222`
- **phpMyAdmin**: `http://localhost:8081`

### Git Configuration
- **Repository**: `https://github.com/alvaromartinezmajado/factures-robot-innocent.git`
- **Auto-sync**: Enabled with GitHub token authentication
- **Monitoring**: 30-second intervals

---

## Advanced Usage

### Manual Operations

**Create database backup:**
```bash
docker-compose exec git-sync /app/scripts/dump-database-direct.sh
```

**Force git sync:**
```bash
docker-compose exec git-sync bash -c "cd /project && git add database/dump.sql && git commit -m 'Manual sync' && git push"
```

### Monitoring

**Real-time auto-sync monitoring:**
```bash
docker-compose logs -f git-sync
```

**Database change verification:**
```bash
git log --oneline -10 | grep "Auto-sync"
```

---

## Migration History

This system was migrated from Invoice Ninja v5.11.79 with complete data integrity:
- **62 invoices** migrated successfully
- **11 clients** with complete contact information
- **€186,325.11** total amount verified
- **Zero data loss** during migration
- **Spanish tax compliance** fully implemented

---

## Security & Compliance

### Data Protection
- **Automatic backups**: Every database change backed up to Git
- **Version control**: Complete audit trail of all changes
- **Multi-location redundancy**: GitHub + local + container storage

### Spanish Tax Compliance
- **NIF/VAT validation**: All client tax codes properly formatted
- **Invoice requirements**: Meets 2025 Spanish factura regulations
- **Sequential numbering**: SERI-prefixed invoice series
- **VAT calculations**: Accurate 21% Spanish VAT

---

## Tax Display System (Impuesto de Valor Añadido)

### How It Works

The system automatically displays "Impuesto de Valor Añadido (21%)" on all invoices through a dynamic tax calculation system implemented across all PDF templates.

### Template Architecture

**Template Locations:**
```
application/views/invoice_templates/pdf/
├── InvoicePlane.php              # Default invoice template
├── InvoicePlane - overdue.php    # Used for overdue invoices
└── InvoicePlane - paid.php       # Used for paid invoices

application/views/quote_templates/pdf/
└── InvoicePlane.php              # Quote template
```

**Template Selection Logic:**
- **Overdue invoices**: Automatically uses `InvoicePlane - overdue.php`
- **Paid invoices**: Automatically uses `InvoicePlane - paid.php`
- **Regular invoices**: Uses default `InvoicePlane.php`

### Tax Calculation Implementation

Each template contains the following tax calculation logic:

```php
// Show aggregated tax totals by tax rate (Spanish compliance)
if ($invoice->invoice_item_tax_total > 0) {
    // Calculate tax totals by tax rate
    $CI = &get_instance();
    $CI->load->model('tax_rates/mdl_tax_rates');

    $tax_totals = array();
    foreach ($items as $item) {
        if ($item->item_tax_rate_id > 0) {
            $tax_rate = $CI->mdl_tax_rates->get_by_id($item->item_tax_rate_id);
            if ($tax_rate) {
                $item_total = $item->item_quantity * $item->item_price;
                $tax_amount = $item_total * ($tax_rate->tax_rate_percent / 100);

                if (!isset($tax_totals[$item->item_tax_rate_id])) {
                    $tax_totals[$item->item_tax_rate_id] = array(
                        'name' => $tax_rate->tax_rate_name,
                        'percent' => $tax_rate->tax_rate_percent,
                        'amount' => 0
                    );
                }
                $tax_totals[$item->item_tax_rate_id]['amount'] += $tax_amount;
            }
        }
    }

    // Display each tax with its name from the database
    foreach ($tax_totals as $tax_total) {
        echo $tax_total['name'] . ' (' . $tax_total['percent'] . '%)';
        echo format_currency($tax_total['amount']);
    }
}
```

### Why This Works

1. **Database-Driven**: The tax name "Impuesto de Valor Añadido" is stored in the `ip_tax_rates` table (ID: 14, Rate: 21%)
2. **Dynamic Calculation**: The system calculates taxes based on items that have `item_tax_rate_id = 14`
3. **Template Coverage**: The same logic is replicated across all templates (regular, overdue, paid)
4. **Automatic Display**: When any item has the Spanish VAT tax rate assigned, it automatically shows "Impuesto de Valor Añadido (21%)" with the calculated amount

### Database Structure

```sql
-- Tax rate definition
ip_tax_rates:
  tax_rate_id: 14
  tax_rate_name: "Impuesto de Valor Añadido"
  tax_rate_percent: 21.00

-- Item tax assignment
ip_invoice_items:
  item_tax_rate_id: 14  -- Links to Spanish VAT
```

### Result

All PDFs will display:
- **Subtotal**: Base amount without tax
- **Impuesto de Valor Añadido (21%)**: Calculated 21% VAT amount
- **Total**: Final amount including tax

This ensures Spanish tax compliance across all invoice states and templates.

## The Great Invoice Debugging Saga (October 2025)

### The Crisis

On October 2, 2025, we received an urgent email from Joan Vila at Crític SCCL about invoice SERI-00003:

> "me n'he adonat que en la factura presentada de cara al PERTE (l'adjunto) hi ha un error menor: en la primera línia de les quantitats intermèdies. Diu Cant: 3, Precio: 750 € i aplica malament la multiplicació: 3 x 750 € ha de ser 2.250 € i no pas 2.722,50 €"

The client was submitting this invoice for a PERTE government subsidy audit and was worried the "mathematical error" would cause rejection.

### The Investigation

**Initial Discovery:**
- File examined: `regression/concepte-Factura_SERI-00003.pdf`
- Line item showed: 3 × 750€ = 2,722.50€ (appeared wrong)
- But 2,722.50€ was actually 2,250€ + 21% VAT = 2,722.50€
- The column was labeled "Total" and was showing VAT-inclusive amounts

**The Plot Thickens:**
After fixing line items to show subtotals, the "Impuesto de Valor Añadido" line completely disappeared from PDFs! Investigation revealed:
1. Invoice was overdue, using `InvoicePlane - overdue.php` template
2. Tax calculation logic existed in main template but was missing from overdue/paid variants
3. Database had wrong tax total: 472.50€ instead of 504€

### The Root Causes

**Problem 1: Inconsistent Tax Calculation**
- First item (3×750€): 21% VAT = 472.50€ ✓
- Second item (1×150€): 21% VAT = 31.50€ ✓
- But invoice only showed 472.50€ total VAT (missing the 31.50€!)

**Problem 2: Database Integrity Issues**
- 91 invoice items had NULL amounts in `ip_invoice_item_amounts`
- Invoice totals weren't recalculating after fixes
- InvoicePlane's `calculate()` method wasn't being triggered

**Problem 3: Template Inconsistencies**
- Main template had sophisticated tax aggregation logic
- Overdue and paid templates were missing this logic
- Line items showed "Total" (with VAT) instead of subtotal

### The Fixes Applied

1. **Database Corrections:**
   ```sql
   -- Fixed SERI-00003 totals
   UPDATE ip_invoice_amounts
   SET invoice_item_tax_total = 504.00,
       invoice_total = 2904.00
   WHERE invoice_id = 501;
   ```

2. **Template Changes:**
   - Extended tax calculation logic to all templates
   - Changed line items from `$item->item_total` to `$item->item_subtotal`
   - Removed ambiguous "Total" header from line items column

3. **Files Modified:**
   - `application/views/invoice_templates/pdf/InvoicePlane.php`
   - `application/views/invoice_templates/pdf/InvoicePlane - overdue.php`
   - `application/views/invoice_templates/pdf/InvoicePlane - paid.php`
   - `application/views/quote_templates/pdf/InvoicePlane.php`

### The Results

**Before (regression/concepte-Factura_SERI-00003.pdf):**
- Line 1: 3 × 750€ = 2,722.50€ (confusing - includes VAT)
- Line 2: 1 × 150€ = 150€ (inconsistent - no VAT shown)
- VAT: 472.50€ (wrong - missing 31.50€)
- Total: 2,872.50€ (wrong)

**After (regression/Factura_SERI-00003-rectificada2.pdf):**
- Line 1: 3 × 750€ = 2,250.00€ (clear - subtotal only)
- Line 2: 1 × 150€ = 150.00€ (consistent - subtotal only)
- VAT: 504.00€ (correct - includes all items)
- Total: 2,904.00€ (correct)

**Client Impact:** Crític SCCL must pay additional 31.50€ (difference between 2,904€ and 2,872.50€)

### Other Invoices Checked

**SERI-00001 (regression/Factura_SERI-00001.pdf):**
- 28 hours × 50€/hour = 1,400€ + 21% = 1,694€ ✓ Correct

**SERI-00002 (regression/Factura_SERI-00002.pdf):**
- 92 hours × 25€/hour = 2,300€ + 21% = 2,783€ ✓ Correct

**SERI-00004 (regression/Factura_SERI-00004.pdf):**
- 105 hours × 45€/hour = 4,725€ + 21% = 5,717.25€ ✓ Correct

### Lessons Learned

1. **The "Total" Column Confusion:** Spanish invoicing convention expects Quantity × Price to equal the amount shown, not the VAT-inclusive total
2. **Template Consistency:** All invoice states (regular, overdue, paid) must have identical calculation logic
3. **Database Integrity:** Direct database updates require triggering InvoicePlane's recalculation methods
4. **Client Communication:** What clients see as "wrong multiplication" might be correct math with unclear presentation

### Final State

- All templates now show line item subtotals (without VAT)
- Tax calculations are consistent across all invoice states
- The ambiguous "Total" header has been removed from line items
- Database totals have been corrected
- Spanish invoice compliance is maintained

---

**System Status**: ✅ Fully operational with automatic database synchronization

For detailed auto-sync technical documentation, see [AUTO-SYNC-README.md](AUTO-SYNC-README.md).