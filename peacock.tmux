#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOOKS_DIR="$CURRENT_DIR/hooks"


main() {
    tmux set-hook -g after-new-session "run-shell -b '${HOOKS_DIR}/set_session_style.sh'"
    tmux set-hook -g after-new-window "run-shell -b '${HOOKS_DIR}/set_window_style.sh'"
    tmux set-hook -g after-rename-session "run-shell -b '${HOOKS_DIR}/set_session_style.sh'"
}

main
