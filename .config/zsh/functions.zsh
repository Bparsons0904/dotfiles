export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc
function load-nvmrc() {
  local nvmrc_path="$(pwd)/.nvmrc"
  if [ -f "$nvmrc_path" ]; then
    nvm use
  fi
}

# # Auto-load .env files
# load_dotenv() {
#   if [ -f .env ]; then
#     set -o allexport
#     source .env
#     set +o allexport
#   fi
# }
# add-zsh-hook chpwd load_dotenv
# load_dotenv
