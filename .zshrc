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
bindkey '^j' autosuggest-execute

zle -N h
bindkey '^R' h # map Ctrl+R
h() {
  eval $(
    (
      ([ -n "$ZSH_NAME" ] && fc -l 1 || history) \
      | sed -E 's/ *[0-9]*\*? *//' \
      | sed -E 's/\\/\\\\/g' \
      | tac | awk '!seen[$0]++' | tac \
      | fzy -l 200
    )
  )
}

