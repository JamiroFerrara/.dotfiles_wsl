#!/bin/zsh

clear
local result=$(jira issue list -a$(jira me) --order-by rank --reverse --plain | fzy)
local id=$(echo $result | awk '{print $2}')
jira issue view $id
