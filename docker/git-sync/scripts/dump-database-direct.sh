#!/bin/bash
set -e

# This script dumps the database directly without using docker-compose

echo "Creating direct database dump..."

# Ensure the database directory exists
mkdir -p /project/database

# Get the absolute path to the dump file
DUMP_FILE=/project/database/dump.sql

# Dump the database directly
echo "Dumping database to database/dump.sql..."
mariadb-dump -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" \
    --single-transaction \
    --routines \
    --triggers \
    --databases "$DB_NAME" > "$DUMP_FILE"

echo "Database dump complete."