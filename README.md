# Tmux Peacock

Plugin that changes tmux styles based on session name.

[![asciicast](https://asciinema.org/a/399925.svg)](https://asciinema.org/a/399925)

### Installation with Tmux Plugin Manager (recommended)

Add plugin to the list of TPM plugins:

```tmux.conf
set -g @plugin 'imomaliev/tmux-peacock'
```

Press prefix + I to install it.

### Manual Installation

Clone the repo:

```bash
$ git clone https://github.com/imomaliev/tmux-peacock.git ~/clone/path
```

Add this line to your .tmux.conf:

```tmux.conf
run-shell ~/clone/path/peacock.tmux
```

Reload TMUX environment with:

```bash
$ tmux source-file ~/.tmux.conf
```

### Configurations

#### Customize styles

If you would like to config your status bar you could use personalized hooks for session and window styles

```tmux.conf
set-option -g '@peacock:hooks:session-style' "/path/to/hook.sh"
set-option -g '@peacock:hooks:window-style' "/path/to/hook.sh"
```

This hooks are expected to be executable `.sh` files.
In which you could set desired tmux config and styles on per session basis. `$TMUX_PEACOCK_SESSION_COLOUR` env variable is provided.

Here are some examples from my dotfiles

[tmux.conf](https://github.com/imomaliev/dotfiles/blob/7eebbc6e1b68240eba9cf76386db6bbdfb09435f/roles/tmux/files/tmux.conf#L76)
[session-style-hook](https://github.com/imomaliev/dotfiles/blob/7eebbc6e1b68240eba9cf76386db6bbdfb09435f/roles/tmux/files/hooks/set_session_style.sh)

### Inspirations

Tmux peacock inspired by https://github.com/johnpapa/vscode-peacock

### License

[MIT](LICENSE)
