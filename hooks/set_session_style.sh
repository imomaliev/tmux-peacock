#!/usr/bin/env bash
set -euo pipefail

tmux set-option status-style "$(tmux show-option -gv status-style)"
tmux set-option -a status-style "bg=${TMUX_PEACOCK_SESSION_COLOUR}"
