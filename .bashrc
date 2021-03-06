#!/bin/sh

# PATH
export PATH=/usr/local/bin:$PATH
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:$PATH
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export HBASE_HOME="/usr/local/Cellar/hbaouse/1.3.5/libexec"
export PYTHON3_HOME="/Users/norikakizawa/Library/Python/3.9/bin"
export PATH="$PYTHON3_HOME:$PATH"
#export RUSTUP_HOME="/Users/norikakizawa/.rustup:$PATH"

#Command Aliases
alias hstart="sh /usr/local/Cellar/hadoop/3.2.1_1/sbin/start-all.sh"
alias hstop="sh /usr/local/Cellar/hadoop/3.2.1_1/sbin/stop-all.sh"
alias hbase-start="sh /usr/local/Cellar/hbase/1.3.5/bin/start-hbase.sh"
alias hbase-stop="sh /usr/local/Cellar/hbase/1.3.5/bin/stop-hbase.sh"
alias tsdb="sh /Users/norikakizawa/Project/neukind/opentsdb/build/tsdb"
alias activate="source $PYENV_ROOT/versions/anaconda3-4.2.0/bin/activate"

#Aliases

alias h="history"
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="/usr/local/opt/unzip/bin:$PATH"
