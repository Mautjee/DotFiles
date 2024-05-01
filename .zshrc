# ~/.zshrc

eval "$(starship init zsh)"
source ~/Dev/Git/zsh-autocomplete/zsh-autocomplete.plugin.zsh 
zstyle '*:compinit' arguments -D -i -u -C -w
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias ide="~/.config/devEnv/ide.sh"
alias ta="~/.config/devEnv/ta.sh"
alias neovim="/usr/local/bin/nvim"

alias nvimSelf="NVIM_APPNAME=nvimSelf nvim"
alias nvimChad="NVIM_APPNAME=nvimChad nvim"
alias nvimAstro="NVIM_APPNAME=nvimAstro nvim"
alias nvimLazy="NVIM_APPNAME=nvimLazy nvim"
alias nvim2="NVIM_APPNAME=nvimSelf2 nvim"
alias nvim="neovim"
alias vi="neovim"
alias kgpa="kubectl get pods -A"

alias mzk="node /Users/mauro/.nvm/versions/node/v18.12.1/lib/node_modules/zkapp-cli/src/bin/index.js"

function nvims() {
  items=("default" "nvimSelf" "nvimChad" "nvimAstro" "nvimPerf")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
eval "$(zoxide init zsh)"

export NARGO_HOME="/Users/mauro/.nargo"
export PATH="$PATH:$NARGO_HOME/bin"

# bun completions
[ -s "/Users/mauro/.bun/_bun" ] && source "/Users/mauro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

export BW_SESSION="VT7GdE6Z1gZSiYSfbh1YENPcssj9yXQMCJyqTxSpDUp/t38GE5wcxgbbvRsw7+VZRdJ3sAiqImK4fc7h3CU5Tg=="

# Bitwarden
path+=('/Users/mauro/Dev/Git/Bitwarden')

export PATH

export PATH="/opt/homebrew/opt/avr-gcc@8/bin:$PATH"
export PATH="/opt/homebrew/opt/arm-none-eabi-binutils/bin:$PATH"
export PATH="/opt/homebrew/opt/arm-none-eabi-gcc@8/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$HOME/Dev/flutter/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

source <(kubectl completion zsh)
