#!/bin/bash
set -e

# This script restores the database from a file.

DUMP_FILE=database/dump.sql

if [ ! -f "$DUMP_FILE" ]; then
    echo "Dump file not found: $DUMP_FILE"
    exit 1
fi

# Get database credentials from the running db container's environment
echo "Fetching DB credentials from running db container..."
DB_ENV=$(docker-compose exec -T db env)
DB_USER=$(echo "$DB_ENV" | grep MARIADB_USER | cut -d'=' -f2 | tr -d '\r')
DB_PASSWORD=$(echo "$DB_ENV" | grep MARIADB_PASSWORD | cut -d'=' -f2 | tr -d '\r')

echo "Restoring database from $DUMP_FILE..."
cat $DUMP_FILE | docker-compose exec -T db mariadb -u"$DB_USER" -p"$DB_PASSWORD"

echo "Database restore complete."
