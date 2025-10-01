#!/bin/bash
set -e

# Configuration
POLL_INTERVAL=${POLL_INTERVAL:-30}  # Check every 30 seconds
PROJECT_DIR=${PROJECT_DIR:-/project}
LAST_CHANGE_FILE="/tmp/last_db_change"

echo "Database change monitor started (polling every ${POLL_INTERVAL}s)"

# Function to get database checksum
get_db_checksum() {
    mariadb -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" -e "
    SELECT
        CONCAT(
            COALESCE(SUM(CRC32(CONCAT_WS('|',
                i.invoice_id,
                i.invoice_number,
                i.invoice_date_modified,
                i.invoice_status_id,
                COALESCE(ia.invoice_total, 0)
            ))), 0),
            '_',
            COALESCE(SUM(CRC32(CONCAT_WS('|',
                c.client_id,
                c.client_name,
                c.client_date_modified,
                c.client_address_1,
                c.client_address_2,
                c.client_tax_code
            ))), 0),
            '_',
            COALESCE(SUM(CRC32(CONCAT_WS('|',
                ii.item_id,
                ii.invoice_id,
                ii.item_name,
                ii.item_quantity,
                ii.item_price
            ))), 0)
        ) as checksum
    FROM ip_invoices i
    LEFT JOIN ip_invoice_amounts ia ON i.invoice_id = ia.invoice_id
    LEFT JOIN ip_clients c ON i.client_id = c.client_id
    LEFT JOIN ip_invoice_items ii ON i.invoice_id = ii.invoice_id;
    " -s -N
}

# Function to perform git sync
perform_git_sync() {
    echo "$(date): Database changes detected, starting sync..."

    cd "$PROJECT_DIR"

    # Create database dump
    echo "Creating database dump..."
    /app/scripts/dump-database-direct.sh

    # Add changes to git
    git add database/dump.sql

    # Check if there are actual changes to commit
    if git diff --staged --quiet; then
        echo "No actual changes in database dump, skipping commit."
        return 0
    fi

    # Commit changes
    COMMIT_MSG="Auto-sync: Database changes detected at $(date '+%Y-%m-%d %H:%M:%S')

Changes detected in:
- Invoices, clients, or invoice items
- Triggered by automatic monitoring system

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"

    git commit --no-verify -m "$COMMIT_MSG"

    # Push to remote if configured
    if [ -n "$GIT_REMOTE_URL" ] && [ -n "$GITHUB_TOKEN" ]; then
        echo "Setting up GitHub authentication and pushing..."

        # Configure git with token authentication
        git remote remove origin 2>/dev/null || true
        git remote add origin "https://${GITHUB_TOKEN}@${GIT_REMOTE_URL#https://}"

        # Push to remote
        echo "Pushing to GitHub repository..."
        if git push -u origin main; then
            echo "Successfully pushed to GitHub"
        else
            echo "Push failed, will retry on next change"
        fi
    elif git remote get-url origin &>/dev/null; then
        echo "Pushing to GitHub repository..."
        if git push; then
            echo "Successfully pushed to GitHub"
        else
            echo "Push failed, will retry on next change"
        fi
    else
        echo "No remote configured, commit saved locally only"
    fi

    echo "$(date): Git sync completed successfully"
}

# Initialize last change tracking
if [ ! -f "$LAST_CHANGE_FILE" ]; then
    get_db_checksum > "$LAST_CHANGE_FILE"
    echo "$(date): Initialized change tracking"
fi

# Main monitoring loop
while true; do
    current_checksum=$(get_db_checksum)
    last_checksum=$(cat "$LAST_CHANGE_FILE" 2>/dev/null || echo "")

    if [ "$current_checksum" != "$last_checksum" ]; then
        echo "$current_checksum" > "$LAST_CHANGE_FILE"
        perform_git_sync
    else
        echo "$(date): No changes detected"
    fi

    sleep "$POLL_INTERVAL"
done