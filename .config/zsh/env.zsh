# Load .env file if it exists (for local environment variables and secrets)
if [[ -f "$HOME/dotfiles/.env" ]]; then
  set -a  # automatically export all variables
  source "$HOME/dotfiles/.env"
  set +a  # disable auto-export
fi

# export PATH="$PATH:$HOME/.local/bin"
# export PATH="$PATH:$HOME/.local/bin:/opt/nvim-linux64/bin"
# export EDITOR=nvim
# export PATH="$(brew --prefix erlang)/bin:$PATH"
export PATH="/opt/nvim-linux64/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:/root/.local/bin"
export GEMINI_MODEL="gemini-2.5-pro"
export EDITOR=nvim
export PATH="/opt/homebrew/sbin:$PATH"
# $HOME/.local/bin

# Disable vim mode in terminal (keep emacs mode for better terminal experience)
bindkey -e
