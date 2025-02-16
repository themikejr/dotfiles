# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# AUTOJUMP
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ANTIGEN
source /opt/homebrew/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle lukechilds/zsh-nvm
antigen theme robbyrussell
antigen apply

# macOS
defaults write -g ApplePressAndHoldEnabled -bool false

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ALIASES
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias nvim-3='nvim -c "Neotree" -c "wincmd l" -c "vsplit | enew | setlocal buftype=nofile" -c "vsplit | enew | setlocal buftype=nofile"'
# alias vim="lvim"
# alias vim-3="lvim -O3 -c 'NvimTreeToggle'"
# alias hal='(cd ~/Development/themikejr/hal && poetry run python hal.py)'

function brew-install() {
  xargs brew install < ~/brews.txt
}

function npm-g-install() {
  cat ~/nodes.txt | xargs printf '%s@latest\ ' | xargs npm install -g
}

function upgrade() {
  echo "------------------------"
  echo "UPGRADE"
  echo "------------------------"

  echo "UPGRADING HOMEBREW PACKAGES"
  brew update
  brew upgrade

  echo "UPGRADE ZSH PLUGINS"
  omz update --unattended > /dev/null

  echo "CLEANUP HOMEBREW"
  brew autoremove
  brew cleanup -s
  brew tap --repair
  #rm -rf ${brew --cache}

  echo "UPGRADE PYTHON PACKAGES"

  echo "UPGRADE GLOBAL NPM PACKAGES"
  npm-g-install 
  nvm install node --reinstall-packages-from-node
}

# RUBY
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# DOTNET
export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"

# Icu4c
# export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
# export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/icu4c/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/icu4c/include"
# export DYLD_LIBRARY_PATH="/opt/homebrew/opt/icu4c/lib:$DYLD_LIBRARY_PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/themikejr/.cache/lm-studio/bin"

# PIPX
export PATH="$HOME/.local/bin:$PATH"
