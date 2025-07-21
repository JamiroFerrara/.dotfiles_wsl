#!/bin/zsh
source "${HOME}/.zshrc"

clear
local result=$(jira issue list -a$(jira me) -q"project IS NOT EMPTY" -s~Chiuso -s~"On Hold" -s~Risolti -s~"Ready for Test" --order-by rank --reverse --plain --no-headers --columns status,key,summary | fzf --reverse --preview "jira issue view {2} --plain --comments 5")
clear
local id=$(echo $result | awk '{print $2}')
jira issue view $id --plain
# Wait for user to press a button before exiting
echo "Press any key to continue..."
read -n 1 -s  # -n 1 waits for one character, -s makes it silent
