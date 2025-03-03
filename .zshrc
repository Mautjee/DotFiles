# ~/.zshrc

eval "$(starship init zsh)"

zstyle '*:compinit' arguments -D -i -u -C -w

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" 

alias kgpa="kubectl get pods -A"
alias lgit="lazygit"

eval "$(zoxide init zsh)"

# bun completions
[ -s "/Users/mauro/.bun/_bun" ] && source "/Users/mauro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.aztec/bin:$PATH"
export PATH="$PATH:/Users/mauro/Library/Python/3.9/bin"

export XDG_CONFIG_HOME="$HOME/.config"

source <(kubectl completion zsh)

export NARGO_HOME="/Users/mauro/.nargo"

export PATH="$PATH:$NARGO_HOME/bin"
