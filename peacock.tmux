#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOOKS_DIR="$CURRENT_DIR/hooks"

session_created_hook='@peacock:hooks:session-created'
window_created_hook='@peacock:hooks:window-created'

default_set_environment_hook="${HOOKS_DIR}/set_session_colour.sh"
default_session_created_hook="${HOOKS_DIR}/set_session_style.sh"
default_window_created_hook="${HOOKS_DIR}/set_window_style.sh"

main() {
    local -r session_created_hook=$(tmux show-option -gqv "${session_created_hook}")
    local -r window_created_hook=$(tmux show-option -gqv "${window_created_hook}")
    tmux set-hook -ga session-created "run-shell '$default_set_environment_hook'"
    tmux set-hook -ga session-created "run-shell '${session_created_hook:-$default_session_created_hook}'"
    tmux set-hook -ga session-renamed "run-shell '$default_set_environment_hook'"
    tmux set-hook -ga session-renamed "run-shell '${session_created_hook:-$default_session_created_hook}'"
    # using additional window hook because some settings are not applied properly
    # on 'session-created' hook
    tmux set-hook -ga window-linked "run-shell '${window_created_hook:-$default_window_created_hook}'"

}

main
