#!/usr/bin/sh

source "${HOME}/.zshrc"

tmux capture-pane -p -S - | nvim -c 'set buftype=nofile' -c 'set nonumber' +'$'
