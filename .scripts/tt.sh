#!/bin/zsh
source /home/jferrara/.zshrc

open_sessions=$(tmux ls | awk '{print $1}')
# open_sessions=${open_sessions::-1}
open_sessions=$(echo "$open_sessions" | rev | cut -c 2- | rev) 
selected_session=$(echo $open_sessions | fzf-tmux -p --reverse)
tmux switch-client -t "$selected_session"
