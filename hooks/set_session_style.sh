#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/../scripts"

get_session_colour="$SCRIPTS_DIR/get_session_colour.sh"

TMUX_PEACOCK_SESSION_COLOUR=$($get_session_colour)
TMUX_PEACOCK_SESSION_INVERTED_COLOUR="black"
tmux set-environment TMUX_PEACOCK_SESSION_COLOUR "${TMUX_PEACOCK_SESSION_COLOUR}"
tmux set-environment TMUX_PEACOCK_SESSION_INVERTED_COLOUR "${TMUX_PEACOCK_SESSION_INVERTED_COLOUR}"
tmux set-option status-style "fg=${TMUX_PEACOCK_SESSION_INVERTED_COLOUR},bg=${TMUX_PEACOCK_SESSION_COLOUR}"
tmux set-option pane-active-border-style "fg=${TMUX_PEACOCK_SESSION_COLOUR}"
