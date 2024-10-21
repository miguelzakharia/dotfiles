# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/miguel/.zsh/completions:"* ]]; then export FPATH="/Users/miguel/.zsh/completions:$FPATH"; fi

source $HOME/.exports
source $HOME/.aliases
source $HOME/.functions
#source $HOME/.macos

# history setup
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# .NET Core
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet
# end .NET core

autoload -U compinit; compinit
. "/Users/miguel/.deno/env"

eval "$(starship init zsh)"
