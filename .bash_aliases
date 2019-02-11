# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# " Original: Lucy Park  (http://lucypark.kr - 525600min@gmail.com, https://github.com/e9t/dotfiles)
# " Modifier: Andrew Lee (y9yk@gmail.com)
# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# Change when necessary
export HOME="$HOME"
export PATH="$PATH:$HOME/bin"

# Import constants
if [ -f ~/.bash_constants ]; then
    . ~/.bash_constants
fi

# ----------------------------------------------------------------------------
# Environment variables
# ----------------------------------------------------------------------------

# Set locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PYTHONIOENCODING=UTF-8   # http://stackoverflow.com/a/6361471/1054939

# Tell 'ls' to be colorful
export CLICOLOR=1
export LSCOLORS='GxFxCxDxBxegedabagacedx'

# Linker library
export LD_LIBRARY_PATH='/usr/local/lib'

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------

# global
alias sourceb='source ~/.bashrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi="vim -p -N -n -i NONE -u '$HOME/.vimrc'"
alias tl='tree -L 2'

# tmux
alias tm='tmux'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - --no-rehash)"
eval "$(pyenv virtualenv-init -)"

# ----------------------------------------------------------------------------
# Misc
# ----------------------------------------------------------------------------

# bash history logging
if [ -d "$HOME/.logs" ]; then
    export HISTCONTROL=ignoredups:erasedups
    shopt -s histappend
    export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'
fi

# os specific
if [ "$(uname)" == "Darwin" ]; then
    if [ -f "$HOME/.bash_macosx" ]; then
        . $HOME/.bash_macosx
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    if [ -f "$HOME/.bash_linux" ]; then
        . $HOME/.bash_linux
    fi
fi

# local bash
if [ -f "$HOME/.bash_local" ]; then
    . $HOME/.bash_local
fi
