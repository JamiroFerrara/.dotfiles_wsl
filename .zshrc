# [Plugins]
source ~/.local/share/zsh/z/zsh-z.plugin.zsh
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
# eval "$(mcfly init zsh)"

# [SSH]
# {eval ``keychain --eval --agents ssh id_rsa} &>/dev/null

# [Configuration]
source ~/.env
source ~/.alias
source ~/.functions

# Options
setopt appendhistory
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
bindkey '^J' autosuggest-execute

# [Load once a day to speed up zsh]
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Tmux
if [ "$TMUX" = "" ]; then tn; fi
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Atuin
export ATUIN_NOBIND="true"
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

bindkey '^[r' atuin-search
# bindkey -r '^I'
# bindkey -r '^M'

. "$HOME/.local/bin/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
