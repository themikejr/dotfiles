export FZF_DEFAULT_COMMAND='rg --no-ignore --files --hidden --follow --glob "!.git/*"'

# Git
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"

# Vim
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
	alias view='nvim -R'
fi

export EDITOR='nvim'

# Say
alias google_first="say 'did you google it first?'"
alias test_first="say 'did you write a unit test for this?'"

# Misc
alias flush-cache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
alias la="ls -altrh"
