eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History Setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# History Completion 
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Alias
alias ls="eza --icons=always"
alias cat="bat"
