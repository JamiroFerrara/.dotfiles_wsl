#!/bin/zsh
number=$1

vault="~/vault"
db="~"
favourites=$(cat /home/jferrara/.scripts/harpoonier.list)

# Assuming your harpoonier.list has one path per line, you can use awk to select the path
selected_path=$(echo "$favourites" | awk "NR==$number")

# If number is vault or db, set the path to the vault or db
if [ "$number" = "vault" ]; then
    selected_path=$vault
elif [ "$number" = "db" ]; then
    selected_path=$db
fi

FOLDER=$(basename "$selected_path")
SESSION_NAME=$(echo "$FOLDER" | tr ' ' '_' | tr '.' '_')

SESSION=$(tmux list-sessions | grep -F "$SESSION_NAME" | awk '{print $1}') # find existing session
SESSION=${SESSION//:/} # grab session name

if [ "$TMUX" = "" ]; then # if not currently in tmux
    if [ "$SESSION" = "" ]; then # session does not exist
        cd "$selected_path" || exit 1 # jump to directory
        tmux new-session -s "$SESSION_NAME" # create session and attach
    else # session exists
        tmux attach -t "$SESSION" # attach to session
    fi
else # currently in tmux
    if [ "$SESSION" = "" ]; then # session does not exist
        cd "$selected_path" || exit 1 # jump to directory
        tmux new-session -d -s "$SESSION_NAME" nvim -c 'lua require("harpoon.ui").nav_file(1)' # create session
        tmux switch-client -t "$SESSION_NAME" # attach to session
    else # session exists
        tmux switch-client -t "$SESSION" # switch to session
    fi
fi
