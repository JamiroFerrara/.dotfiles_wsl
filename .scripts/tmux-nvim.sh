#!/bin/zsh

SESSION_NAME="user"

SESSION=$(tmux list-sessions | grep -F "$SESSION_NAME" | awk '{print $1}') # find existing session
SESSION=${SESSION//:/} # grab session name


if [ "$SESSION" = "" ]; then # session does not exist
    cd "${HOME}/.config/nvim/lua/user/" || exit 1 # jump to directory
    tmux new-session -d -s "$SESSION_NAME" nvim # create session
    tmux switch-client -t "$SESSION_NAME" # attach to session
else # session exists
    tmux switch-client -t "$SESSION_NAME" # switch to session
fi
