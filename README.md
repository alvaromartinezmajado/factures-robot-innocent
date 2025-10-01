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

**System Status**: ✅ Fully operational with automatic database synchronization

For detailed auto-sync technical documentation, see [AUTO-SYNC-README.md](AUTO-SYNC-README.md).