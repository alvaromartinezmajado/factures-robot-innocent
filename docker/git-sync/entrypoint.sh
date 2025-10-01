#!/bin/bash
set -e

echo "Starting InvoicePlane Git Sync Monitor..."

# Wait for database to be ready
echo "Waiting for database connection..."
while ! mariadb -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1" &>/dev/null; do
    sleep 2
done
echo "Database connection established."

# Enable binary logging if not already enabled
echo "Checking binary log configuration..."
mariadb -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "
SET GLOBAL log_bin = ON;
SET GLOBAL binlog_format = 'ROW';
FLUSH LOGS;
" || echo "Binary logging may already be configured."

# Start the monitoring process
echo "Starting database change monitor..."
exec /app/scripts/monitor-changes.sh