#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/../scripts"

TMUX_PEACOCK_SESSION_COLOUR=$("${SCRIPTS_DIR}/get_session_colour.sh")

set +e
SET_COLOUR=$(tmux show-environment TMUX_PEACOCK_SESSION_COLOUR 2> /dev/null)
set -e
if [[ -z "$SET_COLOUR" ]]; then
    tmux set-environment TMUX_PEACOCK_SESSION_COLOUR "$TMUX_PEACOCK_SESSION_COLOUR"
fi
