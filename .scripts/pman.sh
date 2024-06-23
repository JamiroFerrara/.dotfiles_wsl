#!/bin/zsh
res=$(exa scripts | fzy)
sh -c "./scripts/$res" | jq
sleep infinity
