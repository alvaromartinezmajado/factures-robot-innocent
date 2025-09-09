#!/bin/bash
set -e

# This script installs the git hooks by creating symlinks in the .git/hooks directory.

GIT_HOOKS_DIR=.git/hooks
PROJECT_HOOKS_DIR=git-hooks

# Create the .git/hooks directory if it doesn't exist
mkdir -p $GIT_HOOKS_DIR

# Create symlinks for all hooks in the project's hooks directory
for hook in $PROJECT_HOOKS_DIR/*; do
    hook_name=$(basename $hook)
    echo "Installing $hook_name hook..."
    ln -sf "../../$hook" "$GIT_HOOKS_DIR/$hook_name"
done

echo "Git hooks installed successfully."
