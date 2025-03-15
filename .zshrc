# Base zsh configuration directory
ZDOTDIR="$HOME/.config/zsh"

# Load core settings
source "$ZDOTDIR/env.zsh"

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

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
