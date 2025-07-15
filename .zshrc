# Base zsh configuration directory
ZDOTDIR="$HOME/.config/zsh"

# Load core settings
source "$ZDOTDIR/env.zsh"

# Load local environment variables (if exists, not tracked in git)
[[ -f "$ZDOTDIR/env.local.zsh" ]] && source "$ZDOTDIR/env.local.zsh"

# Load OS-specific settings
case "$(uname)" in
  Darwin)
    source "$ZDOTDIR/os/darwin.zsh"
    ;;
  Linux)
    source "$ZDOTDIR/os/linux.zsh"
    ;;
esac

# Load all tool configurations
for config in "$ZDOTDIR"/tools/*.zsh; do
  source "$config"
done

# Load aliases and functions last so they can use everything defined above
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"

setopt interactivecomments

# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
