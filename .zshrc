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

alias gp="export GOPATH=$(pwd)"
alias penv="source env/bin/activate"

export PATH="~/bin:$PATH"
