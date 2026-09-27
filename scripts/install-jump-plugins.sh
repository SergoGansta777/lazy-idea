#!/bin/sh

set -eu

state_dir=${XDG_STATE_HOME:-"$HOME/.local/state"}/lazy-idea
cache_dir=${XDG_CACHE_HOME:-"$HOME/.cache"}/lazy-idea/plugins
acejump_archive="$cache_dir/AceJump-3.8.22.zip"
easymotion_archive="$cache_dir/IdeaVim-EasyMotion-1.16.zip"

mkdir -p "$cache_dir"

download() {
  url=$1
  archive=$2
  checksum=$3

  if ! test -f "$archive" || ! echo "$checksum  $archive" | shasum -a 256 -c - >/dev/null 2>&1; then
    curl -fsSL -A lazy-idea "$url" -o "$archive"
  fi
  echo "$checksum  $archive" | shasum -a 256 -c - >/dev/null
}

download \
  "https://plugins.jetbrains.com/files/7086/738977/AceJump.zip" \
  "$acejump_archive" \
  "6f886961a9eb79b2b04da48c5d322c62688eed5f2bb29844fdb54f8d0b5836ac"
download \
  "https://plugins.jetbrains.com/files/13360/628711/IdeaVim-EasyMotion-1.16.zip" \
  "$easymotion_archive" \
  "816ab3bf6f6fc6960bef27279881e3360b983de74dbd8a47e4c9a3e0c257ed0c"

timestamp=$(date +%Y%m%d-%H%M%S)
installed=0
for plugins_dir in "$HOME"/Library/Application\ Support/JetBrains/GoLand*/plugins "$HOME"/Library/Application\ Support/JetBrains/RustRover*/plugins; do
  test -d "$plugins_dir" || continue

  for plugin_name in acejump IdeaVim-EasyMotion; do
    if test -e "$plugins_dir/$plugin_name"; then
      backup="$state_dir/backups/$timestamp/$(basename "$(dirname "$plugins_dir")")/$plugin_name"
      mkdir -p "$(dirname "$backup")"
      mv "$plugins_dir/$plugin_name" "$backup"
    fi
  done

  unzip -q "$acejump_archive" -d "$plugins_dir"
  unzip -q "$easymotion_archive" -d "$plugins_dir"
  printf 'installed: %s\n' "$plugins_dir/acejump"
  printf 'installed: %s\n' "$plugins_dir/IdeaVim-EasyMotion"
  installed=1
done

if test "$installed" -eq 0; then
  printf 'error: no GoLand or RustRover plugin directories found\n' >&2
  exit 1
fi

printf 'Restart each running IDE to load AceJump and IdeaVim-EasyMotion.\n'
