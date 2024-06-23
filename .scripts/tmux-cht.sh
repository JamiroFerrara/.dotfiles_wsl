#!/usr/bin/env bash
selected=`cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

query=$(gum input --placeholder "What would you like to know about "$selected": ")

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    gum spin --spinner pulse --title "Searching the cheatsheet database.." --show-output -- \
    curl -s cht.sh/$selected/$query
else
    gum spin --spinner pulse --title "Searching the cheatsheet database.." --show-output -- \
    curl -s cht.sh/$selected~$query | less
fi
