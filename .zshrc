# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="minimal"
ZSH_THEME="william"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git osx bundler brew github node npm)
plugins=(mercurial git osx brew github node npm)


source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/opt/local/bin:/opt/local/sbin:$PATH

export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=2
export LSCOLORS=ExFxCxDxBxegedabagacad
export LESS="-R"

export NODE_PATH=/usr/local/lib/node_modules
export PYTHONSTARTUP=~/.pythonstartup

export EDITOR=vim

source ~/.bash_alias

function euler() {
    local NEW=`new_euler_problem $*`
    [[ -n "$NEW" ]] && cd $NEW
}
    
function mkf() {mkdir -p $1 && cd $1}
alias mkf='nocorrect mkf'

function mw() { watchr -e 'watch(".") {system "make"}' }
alias mw='nocorrect mw'

alias mkdir='nocorrect mkdir'
alias mkdir='nocorrect mcd'
alias rm='nocorrect rm -i'
alias cp='nocorrect cp -i'
alias mv='nocorrect mv -i'
alias euler='nocorrect euler'
alias :e='vim'

alias glg='git log --max-count=10 --decorate --graph --oneline'
alias glgs='git log --stat --max-count=10 --decorate --graph --oneline'
