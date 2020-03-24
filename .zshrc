export FZF_DEFAULT_COMMAND='rg --no-ignore --files --hidden --follow --glob "!.git/*"'

# iTerm2
function title() { echo -ne "\e]1;$1\a" }
export DISABLE_AUTO_TITLE="true"

# Git
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gt="git log --since=midnight --author='<author here>' --oneline"

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

function announce() {
    echo ""
    echo "----------------------------------"
    echo $1
    echo "----------------------------------"
    echo ""
}
function update() {
    announce "updating homebrew packages"
    brew update
    brew upgrade
    brew cleanup -s

    announce "upgrade brew cask packages"
    brew cask upgrade

    announce "updating nvm node stable"
    nvm install node --reinstall-packages-from=node

	announce "upgrading npm via nvm"
    nvm install-latest-npm

    announce "upgrading global npm packages"
    npm update -g

    announce "updating nvm lts/dubnium"
    nvm install lts/dubnium --reinstall-packages-from=node

    announce "updating vim plugins"
    vim +PlugUpdate +PlugUpgrade +UpdateRemotePlugins +qa

    announce "updating python2 nvim provider"
    python2 -m pip install --user --upgrade pynvim

    announce "updating python3 nvim provider"
    python3 -m pip install --user --upgrade pynvim

    announce "upgrading oh-my-zsh"
    upgrade_oh_my_zsh

    announce "you can hit mas upgrade to upgrade theses apps from the app store:"
    mas outdated
}

function install_defaults() {
    announce "VSCode ApplePressAndHoldEnabled = false"
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

    announce 'screencapture location = ~/Documents/screenshots'
    defaults write com.apple.screencapture location ~/Documents/screenshots
}

function install_my_brews() {
    announce 'Installing my brews'
    xargs brew install < $HOME/.themikejr-dotfiles/brews.txt
}

function install_my_casks() {
    announce 'Installing my casks'
    xargs brew cask install < $HOME/.themikejr-dotfiles/casks.txt
}
