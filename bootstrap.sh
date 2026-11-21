#!/bin/bash
# Stow every package in files/ into $HOME; a conflict skips only that package
cd "$(dirname "$0")/files" || exit 1
for pkg in */; do
  pkg="${pkg%/}"
  stow --target "$HOME" "$pkg" || echo "FAILED: $pkg" >&2
done
