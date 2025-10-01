# Automatic Database Sync System

## Overview

This system provides **automatic database synchronization** for InvoicePlane using Docker infrastructure. It monitors database changes at the infrastructure level and automatically creates SQL dumps, commits, and pushes to git without requiring manual intervention or UI-level hooks.

## Architecture

### Infrastructure-Level Monitoring
- **Polling-based detection**: Monitors database checksums every 30 seconds
- **Complete coverage**: Catches ALL database changes regardless of source (UI, API, direct SQL)
- **Docker containerized**: Isolated monitoring service with no application dependencies

### Components

1. **Git-Sync Container** (`invoiceplane-git-sync`)
   - Monitors database changes via checksums
   - Creates automatic SQL dumps
   - Commits and pushes changes to git
   - Runs independently of application containers

2. **Database Change Detection**
   - Checksums invoices, clients, and invoice items
   - Detects modifications, additions, and deletions
   - Avoids false positives from read-only operations

## Features

### ✅ **Automated Workflow**
- **Database Change Detection**: Monitors critical tables for any modifications
- **Automatic SQL Dumps**: Creates `database/dump.sql` when changes detected
- **Git Integration**: Commits with descriptive messages and timestamps
- **Push Support**: Optional automatic push to remote repositories
- **Change Tracking**: Intelligent detection prevents unnecessary commits

### ✅ **Configuration Options**
- **Polling Interval**: Configurable monitoring frequency (default: 30 seconds)
- **Remote Git**: Optional automatic push to GitHub/GitLab
- **SSH Key Support**: Mount SSH keys for secure git operations
- **Custom Messages**: Automatic commit messages with change details

## Setup Instructions

### 1. Start the Auto-Sync System

```bash
# Start all containers including git-sync
docker-compose up -d

# Or start just the git-sync container
docker-compose up -d git-sync
```

### 2. Configure Git Remote (Optional)

For automatic push to remote repository:

```bash
# Method 1: Environment variable
# Uncomment and set in docker-compose.yml:
# - GIT_REMOTE_URL=git@github.com:yourusername/invoiceplane.git

# Method 2: Setup via container
docker-compose exec git-sync /app/scripts/setup-git-remote.sh git@github.com:yourusername/invoiceplane.git
```

### 3. SSH Key Setup (For Private Repositories)

```bash
# Mount your SSH keys in docker-compose.yml:
# volumes:
#   - ~/.ssh:/root/.ssh:ro
```

## How It Works

### Monitoring Process

1. **Checksum Calculation**: Every 30 seconds, calculates checksums of:
   - Invoice data (ID, number, dates, status, amounts)
   - Client data (ID, name, modification dates)
   - Invoice items (ID, names, quantities, prices)

2. **Change Detection**: Compares current checksum with last recorded state

3. **Automatic Sync**: When changes detected:
   - Creates database dump via `mariadb-dump`
   - Adds `database/dump.sql` to git staging
   - Commits with descriptive message
   - Optionally pushes to remote repository

### Example Auto-Generated Commit
```
Auto-sync: Database changes detected at 2025-10-01 14:47:33

Changes detected in:
- Invoices, clients, or invoice items
- Triggered by automatic monitoring system

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Use Cases

### ✅ **Perfect For**
- **Multi-computer sync**: Automatic database synchronization across devices
- **Backup automation**: Never lose invoice data changes
- **Change tracking**: Git history of all database modifications
- **Team environments**: Multiple users making invoice changes
- **Audit trails**: Complete history of when and what changed

### ✅ **Triggers Include**
- Creating new invoices via UI
- Modifying existing invoices
- Adding/editing clients
- Changing invoice items
- Status updates (draft → sent → paid)
- Direct database modifications
- Import operations
- Any database write operation

## Configuration

### Environment Variables

```yaml
environment:
  - DB_HOST=invoiceplane-db
  - DB_USER=ipdevdb
  - DB_PASSWORD=ipdevdb
  - DB_NAME=invoiceplane_db
  - PROJECT_DIR=/project
  - POLL_INTERVAL=30                          # Seconds between checks
  - GIT_REMOTE_URL=git@github.com:user/repo.git  # Optional auto-push
```

### Volume Mounts

```yaml
volumes:
  - .:/project                    # Project files access
  - ~/.ssh:/root/.ssh:ro         # SSH keys (optional)
```

## Monitoring

### Check Status
```bash
# View git-sync logs
docker-compose logs -f git-sync

# Check container status
docker-compose ps git-sync
```

### Manual Operations
```bash
# Force database dump
docker-compose exec git-sync /app/scripts/dump-database-direct.sh

# Setup git remote
docker-compose exec git-sync /app/scripts/setup-git-remote.sh YOUR_REPO_URL
```

## Technical Details

### Database Tables Monitored
- `ip_invoices` - Invoice records
- `ip_clients` - Client information
- `ip_invoice_items` - Invoice line items
- `ip_invoice_amounts` - Invoice calculations

### Checksum Algorithm
Uses CRC32 checksums of concatenated field values to detect any data changes efficiently.

### Performance Impact
- **Minimal overhead**: Single SQL query every 30 seconds
- **Read-only monitoring**: No database writes during monitoring
- **Efficient detection**: Checksum comparison vs. full table scans

## Troubleshooting

### Common Issues

1. **Container not starting**
   ```bash
   docker-compose logs git-sync
   ```

2. **Git remote issues**
   ```bash
   docker-compose exec git-sync git remote -v
   ```

3. **SSH key problems**
   ```bash
   docker-compose exec git-sync ssh-add -l
   ```

### Manual Testing

```bash
# Make a test change
docker-compose exec -T db mariadb -uipdevdb -pipdevdb invoiceplane_db -e "UPDATE ip_clients SET client_date_modified = NOW() WHERE client_id = 101;"

# Check if detected (wait 30+ seconds)
docker-compose logs --tail=10 git-sync
```

## Integration with Original Git Hooks

This system **complements** the existing git hooks:
- **Manual commits**: Original pre-commit hook still works
- **Automatic commits**: New auto-sync for real-time changes
- **Complete coverage**: Both manual and automatic workflows supported

The auto-sync system ensures that **every database change** is captured, even if users forget to manually commit after creating invoices.

---

**Status**: ✅ Fully functional infrastructure-level database monitoring with automatic git synchronization