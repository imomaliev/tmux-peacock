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

### License

[MIT](LICENSE)
