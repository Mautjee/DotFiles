# ~/.zshrc

eval "$(starship init zsh)"
source ~/Dev/Git/zsh-autocomplete/zsh-autocomplete.plugin.zsh 
zstyle '*:compinit' arguments -D -i -u -C -w

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias ide="~/.config/devEnv/ide.sh"
alias ta="~/.config/devEnv/ta.sh"

alias nvim="neovim"
alias vi="neovim"

alias kgpa="kubectl get pods -A"
alias lgit="lazygit"

eval "$(zoxide init zsh)"

# bun completions
[ -s "/Users/mauro/.bun/_bun" ] && source "/Users/mauro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

export PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

source <(kubectl completion zsh)
