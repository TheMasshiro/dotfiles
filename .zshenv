[ -f "$HOME/.env" ] && source "$HOME/.env"

. "$HOME/.cargo/env"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(direnv hook zsh)"

export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
