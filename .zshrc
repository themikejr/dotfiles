export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

alias gs="git status"
alias la="ls -altrh"

if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
	alias view='nvim -R'
fi

export EDITOR='vim'
