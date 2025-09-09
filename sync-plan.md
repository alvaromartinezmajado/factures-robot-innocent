# Git Sync and Persistence Plan for InvoicePlane

This document outlines the strategy to use Git as a persistence and synchronization mechanism for the InvoicePlane application, including the database and user uploads.

## 1. Restructure for Git

- **Remove `mysql/` from Git:** The `mysql/` directory, which contains live database files, will be removed from Git tracking using `git rm -r --cached mysql`.
- **Ignore `mysql/`:** The `mysql/` path will be added to `.gitignore` to prevent the live database files from ever being committed again.
- **Keep `uploads/`:** The `uploads/` directory will continue to be tracked by Git to ensure all user-uploaded files are synchronized.

## 2. Create Automation Scripts

A `scripts/` directory will be created to hold the following automation scripts:

- `dump-database.sh`: This script will connect to the running `db` container and export the entire database to a single file located at `database/dump.sql`.
- `restore-database.sh`: This script will import the `database/dump.sql` file back into the database of the running `db` container.

## 3. Implement Version-Controlled Git Hooks

A `git-hooks/` directory will be created and tracked by Git to store the hook scripts:

- **`pre-commit` hook:** Before a commit is finalized, this hook will automatically execute the `dump-database.sh` script. It will then add the resulting `database/dump.sql` file to the commit, ensuring every commit includes a fresh database snapshot.
- **`post-merge` hook:** Immediately after a `git pull` or `git merge` that changes files, this hook will automatically execute the `restore-database.sh` script. This will update the local database to match the state from the repository.

## 4. One-Time Hook Installer

A script named `install-hooks.sh` will be created. This script must be run once on each machine where the repository is cloned. It will create the necessary symbolic links from the version-controlled `git-hooks/` directory to the local `.git/hooks/` directory, thereby activating the automated hooks.
