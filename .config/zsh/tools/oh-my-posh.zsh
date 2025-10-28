# eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/jandedobbeleer.omp.json)"
# eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/stelbent.minimal.omp.json)"

# Ensure Oh My Posh cache directory exists and initialize with error handling
if command -v oh-my-posh &> /dev/null; then
    mkdir -p ~/.cache/oh-my-posh
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/stelbent.minimal.omp.json)" 2>/dev/null || {
        # Fallback: clear cache and retry
        rm -f ~/.cache/oh-my-posh/init.*.zsh
        eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/themes/stelbent.minimal.omp.json)"
    }
fi
