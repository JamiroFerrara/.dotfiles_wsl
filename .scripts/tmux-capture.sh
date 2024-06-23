#!/usr/bin/sh

source '/home/jferrara/.zshrc'

tmux capture-pane -p -S - | nvim -c 'set buftype=nofile' -c 'set nonumber' +'$'
