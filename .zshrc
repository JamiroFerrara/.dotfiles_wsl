# [Configuration]
source ~/.env
source ~/.alias
source ~/.functions

# [Options]
setopt appendhistory
precmd() { print -rP "%~" }

# [Tmux]
if [ "$TMUX" = "" ]; then tn; fi
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

. "$HOME/.local/bin/env"

# [Plugins]
eval "$(zoxide init zsh)" #NOTE: 2ms
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh #NOTE: 2/3 ms

zle -N h # Register ‘h’ as a widget
h() {
  eval $(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzy -l 200 | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
