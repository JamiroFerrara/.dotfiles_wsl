#!/bin/zsh
source ~/.local/share/zsh/z/zsh-z.plugin.zsh

# FZF_BORDER_LABEL=" t - smart tmux session manager "
if [ "$TMUX" = "" ]; then
    ZOXIDE_RESULT=$(zoxide query -l -s | fzf --exact --no-sort --reverse | awk '{print $2}')
else
    ZOXIDE_RESULT=$(zoxide query -l -s | fzf-tmux --exact --no-sort -p --reverse | awk '{print $2}')
fi

FOLDER=$(basename "$ZOXIDE_RESULT")
SESSION_NAME=$(echo "$FOLDER" | tr ' ' '_' | tr '.' '_')


SESSION=$(tmux list-sessions | grep -F "$SESSION_NAME" | awk '{print $1}') # find existing session
SESSION=${SESSION//:/} # grab session name

if [ "$TMUX" = "" ]; then # if not currently in tmux
    if [ "$SESSION" = "" ]; then # session does not exist
        # echo $ZOXIDE_RESULT
        # cd "$ZOXIDE_RESULT" || exit 1 # jump to directory
        # tmux new-session -s "$SESSION_NAME" # create session and attach
    else # session exists

        tmux attach -t "$SESSION" # attach to session
    fi
else # currently in tmux

    if [ "$SESSION" = "" ]; then # session does not exist
        cd "$ZOXIDE_RESULT" || exit 1 # jump to directory
        tmux new-session -d -s "$SESSION_NAME" nvim -c 'lua require("harpoon.ui").nav_file(1)' # create session
        tmux switch-client -t "$SESSION_NAME" # attach to session
    else # session exists
        tmux switch-client -t "$SESSION" # switch to session
    fi
fi
