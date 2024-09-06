eval "$(starship init zsh)"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History Setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# History Completion 
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Alias
alias ls="eza --icons=always"
alias cat="bat --paging=never"
alias vim="nvim"

# Zoxide 
eval "$(zoxide init zsh)"
alias cd="z"
