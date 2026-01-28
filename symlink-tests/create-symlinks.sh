#!/bin/bash
# Run this from the repo root to create symlink test fixtures
# Usage: bash symlink-tests/create-symlinks.sh

set -e

cd "$(dirname "$0")"

echo "Creating symlink test fixtures..."

# Safe: points within repo
ln -sf ../README.md safe-link.txt
echo "  Created safe-link.txt -> ../README.md"

# Malicious: absolute path escapes
ln -sf /etc/passwd evil-passwd
echo "  Created evil-passwd -> /etc/passwd"

ln -sf /etc/hosts evil-hosts
echo "  Created evil-hosts -> /etc/hosts"

# Malicious: relative path traversal
ln -sf ../../../etc/passwd traversal-passwd
echo "  Created traversal-passwd -> ../../../etc/passwd"

echo ""
echo "Done. Now commit and push:"
echo "  git add -A && git commit -m 'Add symlink test fixtures' && git push"
