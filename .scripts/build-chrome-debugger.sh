#!/bin/sh

cd "${HOME}/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src"
oldip=$(cat .ip)
ip=$(ip route | head -n 1 | awk '{print $3}')
touch .ip
echo $ip > .ip
sed -i "s/$oldip/$ip/g" ./*.js
