if [ $# -eq 0 ]; then
  make_options=$(grep -oP '^[a-zA-Z0-9_-]+(?=:)' Makefile | fzf)
  make "$make_options"
else
  make "$1"
fi
