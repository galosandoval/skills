#!/usr/bin/env bash
set -euo pipefail

# Links every rule in this repo's rules/ into ~/.claude/rules — the user-level
# rules directory Claude Code loads at launch (path-scoped ones load when a
# matching file is read). Each entry is a symlink into this repo, so a `git pull`
# keeps the installed rules current. This is the rules counterpart to
# link-skills.sh; kept separate so syncing the fork with upstream never
# conflicts on a shared file.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$HOME/.claude/rules"

# If $DEST is a symlink that resolves into this repo, the per-file symlinks below
# would write back into the repo's own rules/ tree. Bail out instead.
if [ -L "$DEST" ]; then
  resolved="$(readlink -f "$DEST")"
  case "$resolved" in
    "$REPO" | "$REPO"/*)
      echo "error: $DEST is a symlink into this repo ($resolved)." >&2
      echo "Remove it (rm \"$DEST\") and re-run; the script will recreate it as a real dir." >&2
      exit 1
      ;;
  esac
fi

mkdir -p "$DEST"

for src in "$REPO"/rules/*.md; do
  name="$(basename "$src")"
  target="$DEST/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    rm -rf "$target"
  fi

  ln -sfn "$src" "$target"
  echo "linked $name -> $src ($DEST)"
done
