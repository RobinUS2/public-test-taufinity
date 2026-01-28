# Symlink Test Setup

These symlinks test that the secure worker correctly blocks path traversal.

## Create these symlinks in the repo

Run from the repo root:

```bash
# Safe symlink: points within repo (should be allowed)
cd symlink-tests
ln -s ../README.md safe-link.txt

# Malicious symlink: points outside repo (MUST be blocked)
ln -s /etc/passwd evil-passwd
ln -s /etc/hosts evil-hosts
ln -s ../../../etc/passwd traversal-passwd

# Commit and push
cd ..
git add -A
git commit -m "Add symlink test fixtures"
git push
```

## Expected behavior

| Symlink | Target | Expected Result |
|---------|--------|-----------------|
| `symlink-tests/safe-link.txt` | `../README.md` | Allowed (stays within repo) |
| `symlink-tests/evil-passwd` | `/etc/passwd` | BLOCKED (absolute path escape) |
| `symlink-tests/evil-hosts` | `/etc/hosts` | BLOCKED (absolute path escape) |
| `symlink-tests/traversal-passwd` | `../../../etc/passwd` | BLOCKED (relative path escape) |

## Note

With `core.symlinks=false` in our safe clone flags, git will create
regular files containing the symlink target path instead of actual
symlinks. This is an additional safety layer - even if EvalSymlinks
is bypassed, the files are just text.
