autoload -Uz compinit

HISTSIZE=1000
SAVEHIST=1000

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' formats '(%F{blue}%b%f)'
zstyle ':vcs_info:*' actionformats '(%F{yellow}%b|%a%f)'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:*' use-current-name true

precmd_functions+=( vcs_info );
setopt prompt_subst
compinit

PROMPT=$'[%F{cyan}%n%f@%F{red}%m%f%F{gray}%B%~%b%f]${vcs_info_msg_0_}\n$ '

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
alias doc="open -a Docker"

export PATH="$PATH:/opt/nvim-linux64/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

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