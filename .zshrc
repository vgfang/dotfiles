autoload -Uz compinit
compinit

HISTSIZE=1000
SAVEHIST=1000

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

NEWLINE=$'\n'
PROMPT=$'[%F{cyan}%n%f@%F{red}%m%f%F{grey}%B%~%b%f]\n$ '
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit

export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

alias gp="export GOPATH=$(pwd)"
alias penv="source env/bin/activate"
alias p="python3"
alias n="nvim ."
# alias ins='bun add $1 -d @types/$1'
alias doc="open -a Docker"

export PATH="$PATH:/opt/nvim-linux64/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

dex() {
  docker exec -it "$1" /bin/bash
}

# ls alias for color based on OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls --color=auto'
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
    source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export DOTNET_ROOT=/opt/homebrew/bin/dotnet
