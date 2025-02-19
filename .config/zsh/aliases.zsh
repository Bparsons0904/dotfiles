# Neovim 
alias neo='NVIM_APPNAME=nvim-neo nvim'

# Bash
# alias rc='nvim ~/.bashrc'
# alias rn='nvim ~/.bash_aliases'
# alias pro='nvim ~/.bash_profile'
# alias src='source ~/.bashrc'
# Zshrc
alias rc='neo ~/.zshrc' 
alias rn='neo ~/.config/zsh/aliases.zsh'
alias pro='neo ~/.config/zsh' 
alias src='source ~/.zshrc' 
alias hy='cd ~/dotfiles/.config/hypr/ && neo'

# Directory
alias lcon='cd ~/.config/lvim'
alias ncon='cd ~/.config/nvim'
alias neocon='cd ~/.config/nvim-neo'
alias dev='cd ~/Development/'
alias bp='cd ~/Development/bobparsons.dev/'
alias dead='cd ~/Development/deadigations/'
alias switches='cd ~/Development/switches/'
alias switchai='cd ~/Development/switch-ai/'
alias post='cd ~/Development/postgres/'
alias kcon='cd ~/.config/kitty/'
alias dot='cd ~/dotfiles/'
alias keydb='cd ~/Development/keydb-switches/'
alias auth='cd ~/Development/zitadel-auth/'
alias dev='cd ~/Development/'

# Via 
alias via='cd ~/Development/bickford/via-platform/'
alias serviam='cd ~/Development/serviam-via/serviam-platform'
alias migrations='cd ~/Development/bickford/via-platform/packages/serviam-db/migrations/'
alias core='cd ~/Development/bickford/via-platform/packages/via-core/'
alias thp='cd ~/Development/serviam-thp/'

# Services
alias gcp='~/cloud_sql_proxy -instances=bickford-nonprod-system:us-central1:nonprod-1=tcp:2234 &'
alias via-stage='rm -rf ~/Development/bickford/database-backups/stage-backup && pg_dump -h localhost -p 2234 -U stage-crm-backend -W -F d -j 4 -d stage -f "/home/bobparsons/Development/bickford/database-backups/stage-backup"'
# alias via-dev='rm -rf ~/Development/bickford/database-backups/dev-backup && pg_dump -h localhost -p 2234 -U stage-crm-backend -W -F d -j 4 -d dev -f "/home/bobparsons/Development/bickford/database-backups/dev-backup"'
alias via-dev='rm -rf ~/Development/bickford/database-backups/dev-backup && pg_dump -h localhost -p 2234 -U stage-crm-backend -F d -j 4 -d dev -f "/home/bobparsons/Development/bickford/database-backups/dev-backup"'
# alias via-dev-restore='pg_restore -h localhost -p 9432 -U postgres -d via_dev -j 4 -F d "/home/bobparsons/Development/bickford/database-backups/dev-backup"'
alias via-dev-restore='pg_restore -h localhost -p 9432 -U postgres -d via_dev -j 4 -F d --no-owner --no-acl --clean --if-exists --verbose "/home/bobparsons/Development/bickford/database-backups/dev-backup"'
alias via-stage-restore='pg_restore -h localhost -p 9432 -U postgres -d via_stage -j 4 -F d "/home/bobparsons/Development/bickford/database-backups/stage-backup"'
alias lg='lazygit'
alias python=python3
alias zj='zellij'
alias za='zellij a'
alias server='ssh -X server'
alias ls='exa -l'
alias lsa='exa -la'
alias du='du -bch'
alias cd='z'

# FZF 
export FZF_EXCLUDE="find . -type f \
    -not -path '*/\.*' \
    -not -path '*/node_modules/*' \
    -not -path '*/venv/*' \
    -not -path '*/__pycache__/*' \
    -not -path '*/target/*' \
    -not -path '*/dist/*' \
    -not -path '*/build/*' \
    -not -name '*.exe' \
    -not -name '*.o' \
    -not -name '*.so' \
    -not -name '*.pyc' \
    -not -name '*.class' \
    -not -name '*.dll'"
alias f='fzf'
alias ff="$FZF_EXCLUDE | fzf --preview 'bat --color=always --style=numbers --line-range :500 {}'"

# Read full file
alias ffr="$FZF_EXCLUDE | fzf --preview 'bat --color=always --style=numbers --line-range :500 {}' | xargs bat"

# Open with default application
alias fff="$FZF_EXCLUDE | fzf --preview 'bat --color=always --style=numbers --line-range :500 {}' \
    --bind 'enter:execute:xdg-open {}' \
    --bind 'ctrl-o:execute:xdg-open {}'"
# Quick directory navigation
alias fcd='cd $(find . -type d | fzf)'

# Search file content and open in editor
alias fneo='neo $(fzf --preview "bat --color=always {}")'

# Kill process
alias fkill='ps aux | fzf | awk "{print $2}" | xargs kill -9'

# Search command history
alias fh='history | fzf --reverse | awk "{$1=\"\"; print substr($0,2)}" | bash'

ffunc() {    # Different name for the function
    file=$(find . -type f | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}')
    if [ -n "$file" ]; then
        bat "$file"
    fi
}
