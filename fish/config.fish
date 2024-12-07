# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# Path
set -x fish_user_paths
fish_add_path /bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
fish_add_path ~/.luarocks/bin
fish_add_path ~/Library/Python/3.{8,9}/bin
fish_add_path /usr/local/opt/sqlite/bin
fish_add_path /usr/local/sbin
fish_add_path ~/.gem/ruby/2.6.0/bin
fish_add_path ~/.local/bin/pnpm
fish_add_path ~/.local/share/bob-nvim/bin
fish_add_path /var/lib/flatpak/exports/bin/
fish_add_path ~/.dotnet/tools
fish_add_path ~/.local/share/mise/shims
fish_add_path ~/.opt/homebrew/bin

set -gx DENO_INSTALL "~/.deno"
fish_add_path ~/.deno/bin

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

# Fish
set fish_greeting
# set fish_emoji_width 2
alias ssh "TERM=xterm-256color command ssh"
alias mosh "TERM=xterm-256color command mosh"

# Exports
set -x LESS -rF
set -x COMPOSE_DOCKER_CLI_BUILD 1
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x DOTDROP_AUTOUPDATE no
set -x MANPAGER "nvim +Man!"
set -x MANROFFOPT -c
set -x OPENCV_LOG_LEVEL ERROR
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # use bat to format man pages
#set -x MANPAGER "most" # use bat to format man pages
#
abbr -a --position anywhere --set-cursor -- -h "-h 2>&1 | bat --plain --language=help"

# Tmux
abbr t tmux
abbr tc 'tmux attach'
abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'
abbr mux tmuxinator

# Files & Directories
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias ls="eza --color=always --icons --group-directories-first"
alias la 'eza --color=always --icons --group-directories-first --all'
alias ll 'eza --color=always --icons --group-directories-first --all --long'
abbr l ll
abbr ncdu "ncdu --color dark"
abbr cd "z"
alias cat "bat --style=plain"

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim
alias vimpager 'nvim - -c "lua require(\'util\').colorize()"'
abbr vd "VIM=~/projects/neovim nvim --luamod-dev"
abbr sv sudoedit
abbr vudo sudoedit
alias lazyvim "NVIM_APPNAME=lazyvim nvim"
abbr lv lazyvim
alias bt "coredumpctl -1 gdb -A '-ex \"bt\" -q -batch' 2>/dev/null | awk '/Program terminated with signal/,0' | bat -l cpp --no-pager --style plain"

# HomeBrew
eval "$(/opt/homebrew/bin/brew shellenv)"
