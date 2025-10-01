#!/bin/bash
# Script to setup git remote for automatic push

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <git-remote-url>"
    echo "Example: $0 git@github.com:user/invoiceplane.git"
    exit 1
fi

GIT_REMOTE_URL="$1"

cd /project

# Add remote if it doesn't exist
if ! git remote get-url origin &>/dev/null; then
    echo "Adding git remote origin: $GIT_REMOTE_URL"
    git remote add origin "$GIT_REMOTE_URL"
else
    echo "Updating git remote origin: $GIT_REMOTE_URL"
    git remote set-url origin "$GIT_REMOTE_URL"
fi

# Test connection
echo "Testing git remote connection..."
git ls-remote origin HEAD &>/dev/null && echo "Git remote connection successful!" || echo "Git remote connection failed!"