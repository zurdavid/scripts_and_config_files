#!/usr/bin/env bash
# Set sway background: edits sway config and applies it live.
# Usage: sway-bg.sh /path/to/image [mode]   (mode default: fill)
set -euo pipefail

img=$(realpath -- "${1:?usage: sway-bg.sh IMAGE [mode]}")
mode=${2:-fill}
cfg=${SWAY_CONFIG:-$HOME/.config/sway/config}

case $(file -b --mime-type -- "$img") in
  image/*) ;;
  *) echo "not an image: $img" >&2; exit 1 ;;
esac

line="output * bg \"$img\" $mode"

if grep -qE '^\s*output\s+\*\s+bg\s' "$cfg"; then
  # replace existing line (escape sed replacement specials)
  esc=$(printf '%s' "$line" | sed 's/[&|\\]/\\&/g')
  sed -i -E "s|^\s*output\s+\*\s+bg\s.*|$esc|" "$cfg"
else
  printf '\n%s\n' "$line" >> "$cfg"
fi

swaymsg output '*' bg "$img" "$mode" >/dev/null
echo "bg -> $img ($mode)"
