eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/themes/stelbent.minimal.omp.json)"
# . "$HOME/.cargo/env"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$(brew --prefix erlang)/bin:$PATH"
export PATH=/home/bobparsons/.cache/rebar3/bin:$PATH
export PATH="$HOME/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
