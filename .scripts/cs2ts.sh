#!/bin/zsh
lines=""
while read -r line
do
   lines+="\n$line"
done < /dev/stdin

# echo "$lines"
lines=$(printf "%s" "$lines" | sed 's/"/\\"/g')

echo $lines > temp.txt

dotnet cs2ts ./temp.txt

cat ./temp.ts

rm -dfr temp.txt
rm -dfr temp.ts

tmux copy-mode -u
sleep infinity
