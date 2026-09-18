#!/bin/sh

set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
expected_dir=$HOME/.config/lazy-idea
backup_root=${XDG_STATE_HOME:-"$HOME/.local/state"}/lazy-idea/backups
timestamp=$(date +%Y%m%d-%H%M%S)

if test "$repo_dir" != "$expected_dir"; then
  printf 'error: clone this repository to %s (currently %s)\n' "$expected_dir" "$repo_dir" >&2
  exit 1
fi

link_config() {
  source_path=$1
  target_path=$2

  mkdir -p "$(dirname -- "$target_path")"

  if test -L "$target_path" && test "$(readlink "$target_path")" = "$source_path"; then
    printf 'already linked: %s\n' "$target_path"
    return
  fi

  if test -e "$target_path" || test -L "$target_path"; then
    backup_dir="$backup_root/$timestamp"
    mkdir -p "$backup_dir"
    mv "$target_path" "$backup_dir/$(basename -- "$target_path")"
    printf 'backed up: %s -> %s\n' "$target_path" "$backup_dir"
  fi

  ln -s "$source_path" "$target_path"
  printf 'linked: %s -> %s\n' "$target_path" "$source_path"
}

link_config "$repo_dir/config/ideavimrc" "$HOME/.ideavimrc"
link_config "$repo_dir/config/.whichkey-lazy.json" "$HOME/.whichkey-lazy.json"

cat <<'EOF'

Configuration installed.

Required IDE plugins:
  - IdeaVim: https://plugins.jetbrains.com/plugin/164-ideavim
  - Which Key Lazy: https://plugins.jetbrains.com/plugin/30446-which-key-lazy

Reload with :source ~/.ideavimrc or restart the IDE.
EOF

"$repo_dir/check.sh"
