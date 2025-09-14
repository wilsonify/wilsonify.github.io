#!/usr/bin/env bash
# remove-submodule.sh
# Usage: ./remove-submodule.sh path/to/submodule

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <submodule-path>"
  exit 1
fi

SUBMODULE_PATH="$1"

# Ensure we're in a git repo
if ! git rev-parse --show-toplevel >/dev/null 2>&1; then
  echo "Error: not inside a git repository."
  exit 1
fi

# Step 1: Deinit the submodule (removes entry from .git/config)
echo "[INFO] Deinitializing submodule: $SUBMODULE_PATH"
git submodule deinit -f "$SUBMODULE_PATH" || true

# Step 2: Remove from index
echo "[INFO] Removing submodule from index"
git rm -f "$SUBMODULE_PATH" || true

# Step 3: Remove the submodule’s .git metadata directory
MODULE_DIR="$(git rev-parse --git-dir)/modules/$SUBMODULE_PATH"
if [ -d "$MODULE_DIR" ]; then
  echo "[INFO] Removing submodule metadata: $MODULE_DIR"
  rm -rf "$MODULE_DIR"
fi

# Step 4: Remove leftover entry in .gitmodules
if [ -f .gitmodules ]; then
  echo "[INFO] Cleaning up .gitmodules"
  git config -f .gitmodules --remove-section "submodule.$SUBMODULE_PATH" 2>/dev/null || true
  if ! grep -q "submodule" .gitmodules; then
    rm -f .gitmodules
    git rm -f --cached .gitmodules || true
  else
    git add .gitmodules
  fi
fi

# Step 5: Commit changes
echo "[INFO] Committing submodule removal"
git commit -m "Remove submodule $SUBMODULE_PATH"

echo "[SUCCESS] Submodule '$SUBMODULE_PATH' removed completely."
