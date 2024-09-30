#!/usr/bin/env bash
set -euo pipefail

# https://superuser.com/questions/410017/how-do-i-know-current-tmux-session-name-by-running-tmux-command
session_name=$(tmux display-message -p "#S")
if command -v shasum &> /dev/null; then
  session_sha=$(echo "${session_name}" | shasum | cut -c1-6)
elif command -v sha256sum &> /dev/null; then
  session_sha=$(echo "${session_name}" | sha256sum | cut -c1-6)
else
  # fallback
  session_sha=$(printf %x "$RANDOM")
fi
# https://stackoverflow.com/questions/13280131/hexadecimal-to-decimal-in-shell-script
# https://stackoverflow.com/questions/428109/extract-substring-in-bash#428580
r=$((16#${session_sha::2}))
g=$((16#${session_sha:2:2}))
b=$((16#${session_sha:4:2}))

# https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php
# https://stackoverflow.com/questions/12807669/how-to-convert-an-rgb-color-to-the-closest-matching-8-bit-color
colour_id=$(((r*6/256)*36 + (g*6/256)*6 + (b*6/256)))

echo "colour$colour_id"
