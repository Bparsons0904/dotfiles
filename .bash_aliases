# Neovim 
alias neo='nvim'
alias lazy='NVIM_APPNAME="nvim-lazy" nvim'
alias chad='NVIM_APPNAME="nvim-chad" nvim'
alias ks='cd ~/.config/nvim-kickstart'

# Bash
alias rc='nvim ~/.bashrc'
alias rn='nvim ~/.bash_aliases'
alias pro='nvim ~/.bash_profile'
alias src='source ~/.bashrc'

# Directory
alias lcon='cd ~/.config/lvim'
alias ncon='cd ~/.config/nvim'
alias dev='cd ~/Development/'
alias bp='cd ~/Development/bobparsons.dev/'
alias switches='cd ~/Development/switches/'
alias kcon='nvim ~/.config/kitty/kitty.conf'
alias dot='cd ~/dotfiles/'

# Via 
alias via='cd ~/Development/bickford/via-platform/'
alias serviam='cd ~/Development/serviam-via/serviam-platform'
alias migrations='cd ~/Development/bickford/via-platform/packages/serviam-db/migrations/'
alias core='cd ~/Development/bickford/via-platform/packages/via-core/'

# Services
alias gcp='~/cloud_sql_proxy -instances=bickford-nonprod-system:us-central1:nonprod-1=tcp:2234 &'
alias via-stage='rm -rf ~/Development/bickford/database-backups/stage-backup && pg_dump -h localhost -p 2234 -U stage-crm-backend -W -F d -j 4 -d stage -f "/home/bobparsons/Development/bickford/database-backups/stage-backup"'
alias via-dev='rm -rf ~/Development/bickford/database-backups/dev-backup && pg_dump -h localhost -p 2234 -U stage-crm-backend -W -F d -j 4 -d dev -f "/home/bobparsons/Development/bickford/database-backups/dev-backup"'
alias via-dev-restore='pg_restore -h localhost -p 9432 -U postgres -d via_dev -j 4 -F d "/home/bobparsons/Development/bickford/database-backups/dev-backup"'
alias via-stage-restore='pg_restore -h localhost -p 9432 -U postgres -d via_stage -j 4 -F d "/home/bobparsons/Development/bickford/database-backups/stage-backup"'
alias lg='lazygit'
alias python=python3
alias z='zellij'
alias za='zellij a'
alias server='ssh -X server'
