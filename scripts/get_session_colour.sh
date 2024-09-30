#!/usr/bin/env bash
set -euo pipefail

hash_from_string () {
  # get modulo of 16 for each char ord and convert it to hexadecimal
  local hashed=""
  for ((i = 0 ; i < 6 ; i++)); do
    # https://stackoverflow.com/a/12855787
    ord=$(printf "%d" "'${1:$i:1}")
    hashed+=$(printf %x $(($ord % 16)))
  done
  echo $hashed
}

# https://superuser.com/questions/410017/how-do-i-know-current-tmux-session-name-by-running-tmux-command
session_name=$(tmux display-message -p "#S")

# macOS
if command -v shasum &> /dev/null; then
  session_hash=$(echo "${session_name}" | shasum | cut -c1-6)
# linux / coreutils
elif command -v sha256sum &> /dev/null; then
  session_hash=$(echo "${session_name}" | sha256sum | cut -c1-6)
else
  # fallback if sha is not available
  session_hash=$(hash_from_string $session_name)
fi

# https://stackoverflow.com/questions/13280131/hexadecimal-to-decimal-in-shell-script
# https://stackoverflow.com/questions/428109/extract-substring-in-bash#428580
r=$((16#${session_hash::2}))
g=$((16#${session_hash:2:2}))
b=$((16#${session_hash:4:2}))

# https://ryanstutorials.net/bash-scripting-tutorial/bash-arithmetic.php
# https://stackoverflow.com/questions/12807669/how-to-convert-an-rgb-color-to-the-closest-matching-8-bit-color
colour_id=$(((r*6/256)*36 + (g*6/256)*6 + (b*6/256)))

echo "colour$colour_id"
