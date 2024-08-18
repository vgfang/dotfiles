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

export PATH=/usr/local/share/npm/bin:$PATH
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

alias gp="export GOPATH=$(pwd)"
alias penv="source env/bin/activate"
alias p="python3"

export PATH="$PATH:/opt/nvim-linux64/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
