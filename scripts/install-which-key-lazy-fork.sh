#!/bin/sh

set -eu

source_dir=${WHICH_KEY_LAZY_SOURCE:-"$HOME/.config/which-key-lazy"}
state_dir=${XDG_STATE_HOME:-"$HOME/.local/state"}/lazy-idea

if test ! -x "$source_dir/gradlew"; then
  printf 'error: Which Key Lazy fork not found at %s\n' "$source_dir" >&2
  exit 1
fi

base_version=$(sed -n 's/^pluginVersion=//p' "$source_dir/gradle.properties" | head -n 1)
if test -z "$base_version"; then
  printf 'error: pluginVersion is missing from %s/gradle.properties\n' "$source_dir" >&2
  exit 1
fi
local_version=${WHICH_KEY_LAZY_VERSION:-"$base_version-local"}
archive="$source_dir/build/distributions/which-key-lazy-$local_version.zip"

if test "${1:-}" != "--no-build"; then
  if test -z "${JAVA_HOME:-}" || test ! -x "$JAVA_HOME/bin/java"; then
    printf 'error: set JAVA_HOME to a JDK 21 installation before building\n' >&2
    exit 1
  fi
  case $("$JAVA_HOME/bin/java" -version 2>&1 | head -n 1) in
    *'"21.'*) ;;
    *) printf 'error: Which Key Lazy currently builds with JDK 21\n' >&2; exit 1 ;;
  esac
  (cd "$source_dir" && ./gradlew --no-daemon -PpluginVersion="$local_version" test buildPlugin)
fi

if test ! -f "$archive"; then
  printf 'error: plugin archive not found: %s\n' "$archive" >&2
  exit 1
fi

timestamp=$(date +%Y%m%d-%H%M%S)
installed=0
for plugins in "$HOME"/Library/Application\ Support/JetBrains/GoLand*/plugins "$HOME"/Library/Application\ Support/JetBrains/RustRover*/plugins; do
  test -d "$plugins" || continue
  if test -e "$plugins/which-key-lazy"; then
    backup="$state_dir/backups/$timestamp/$(basename "$(dirname "$plugins")")"
    mkdir -p "$(dirname "$backup")"
    mv "$plugins/which-key-lazy" "$backup"
  fi
  unzip -q "$archive" -d "$plugins"
  printf 'installed: %s\n' "$plugins/which-key-lazy"
  installed=1
done

if test "$installed" -eq 0; then
  printf 'error: no GoLand or RustRover plugin directories found\n' >&2
  exit 1
fi

printf 'Restart each running IDE to load the new plugin build.\n'
