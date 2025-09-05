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

# Brew configuration is handled in tools/brew.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/bobp/dotfiles/google-cloud-sdk/path.zsh.inc' ]; then . '/home/bobp/dotfiles/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/bobp/dotfiles/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/bobp/dotfiles/google-cloud-sdk/completion.zsh.inc'; fi
