# Minimal .bashrc for compatibility
# Primary shell configuration is in zsh - see .config/zsh/

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Essential PATH configuration
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/nvim-linux64/bin:$PATH"
export EDITOR=nvim

# Go toolchain
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# Node.js via NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Rust toolchain
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Homebrew (Linux)
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Basic aliases for compatibility
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias src="source ~/.bashrc"

export EDITOR=nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/opt/nvim-linux64/bin:$PATH"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(zoxide init bash)"

PATH=~/.console-ninja/.bin:$PATH

# set -o vi

. "$HOME/.local/bin/env"
# Note: Full configuration available in archived bash configs
# See: archive/bash/ for previous comprehensive bash setup
export TERM=xterm-256color

