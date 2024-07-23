[[ $- != *i* ]] && return

PS1=$($HOME/.scripts/prompt.sh)

export PATH="$HOME/.cargo/bin:$PATH"

alias ff="fastfetch"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -la"
alias vim="nvim"
alias vim-vanilla="/usr/bin/vim"
