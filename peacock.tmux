#!/usr/bin/env bash
set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOOKS_DIR="$CURRENT_DIR/hooks"

session_style_hook='@peacock:hooks:session-style'
window_style_hook='@peacock:hooks:window-style'

default_set_environment_hook="${HOOKS_DIR}/set_session_colour.sh"
default_session_style_hook="${HOOKS_DIR}/set_session_style.sh"
default_window_style_hook="${HOOKS_DIR}/set_window_style.sh"

main() {
    local -r session_style_hook=$(tmux show-option -gqv "${session_style_hook}")
    local -r window_style_hook=$(tmux show-option -gqv "${window_style_hook}")
    tmux set-hook -ga session-created "run-shell '$default_set_environment_hook'"
    tmux set-hook -ga session-created "run-shell '${session_style_hook:-$default_session_style_hook}'"
    tmux set-hook -ga session-created "run-shell '${window_style_hook:-$default_window_style_hook}'"
    tmux set-hook -ga session-renamed "run-shell '$default_set_environment_hook'"
    tmux set-hook -ga session-renamed "run-shell '${session_style_hook:-$default_session_style_hook}'"
    tmux set-hook -ga session-renamed "run-shell '${window_style_hook:-$default_window_style_hook}'"
    # using additional window hook because some settings are not applied properly
    # on 'session-created' hook
    tmux set-hook -ga window-linked "run-shell '${window_style_hook:-$default_window_style_hook}'"

}

main
