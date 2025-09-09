#!/bin/bash
set -e

# This script dumps the database to a file.

# Ensure the database directory exists
mkdir -p database

# Get database credentials from the running db container's environment
echo "Fetching DB credentials from running db container..."
DB_ENV=$(docker-compose exec -T db env)
DB_USER=$(echo "$DB_ENV" | grep MARIADB_USER | cut -d'=' -f2 | tr -d '\r')
DB_PASSWORD=$(echo "$DB_ENV" | grep MARIADB_PASSWORD | cut -d'=' -f2 | tr -d '\r')
DB_NAME=$(echo "$DB_ENV" | grep MARIADB_DATABASE | cut -d'=' -f2 | tr -d '\r')

# Get the absolute path to the dump file
DUMP_FILE=$(pwd)/database/dump.sql

# Dump the database using docker-compose
echo "Dumping database to database/dump.sql..."
docker-compose exec -T db mariadb-dump -u"$DB_USER" -p"$DB_PASSWORD" --single-transaction --routines --triggers --databases "$DB_NAME" > "$DUMP_FILE"

echo "Database dump complete."
