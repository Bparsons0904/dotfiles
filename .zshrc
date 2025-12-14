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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi
export TERM=xterm-256color
# Load fzf bindings (location varies by distro)
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi
