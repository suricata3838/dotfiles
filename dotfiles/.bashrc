#!/bin/sh

take="http://web.sfc.keio.ac.jp/~takefuji"

# PATH
export PATH=/usr/local/bin:/usr/local/share/python:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export GOPATH=~/gocode
export PATH=$GOPATH/bin:PATH
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:$PATH
export PYTHONPATH="/Users/norikakizawa/Library/Python/2.7/bin:$PYTHONPATH"

#Aliases


alias ls="ls -G"
alias l="ls -lFh"
alias la="ls -lAFh"

alias ..='cd ..'
alias ...='cd ../..'

alias grep='grep --color=auto'

shopt -s nocaseglob # ignore case in path
shopt -s histappend # don't overwrite history
shopt -s cdspell    # be kind to typo

# handy tree
function tre() {
    tree -aC -I '.git|node_modules|bower_components' "$@" | less -RN
}

# color less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
