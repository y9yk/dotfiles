#!/bin/sh -e
# Author : y9yk
# Usage:
#
#   wget http://bit.ly/envy9yk
#   envy9yk install all
# -----------------------------------------------

set -euo pipefail

# ------------------------------
# command
# ------------------------------

# ------------------------------
# variables
# ------------------------------
home="$HOME"

# ------------------------------
# functions
# ------------------------------
install_pyenv() {
    echo '---------------'
    echo ' pyenv install '
    echo '---------------'
    set -x # start debug mode
    $(which curl) https://pyenv.run | $(which bash) # pyenv, pyenv-virtualenv installation
    
    export PYENV_ROOT="$home/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    $(which pyenv) install 3.5.2
    $(which pyenv) global 3.5.2
    
    set +x
}

install_env() {
    echo '------------------------'
    echo ' environment setting-up '
    echo '------------------------'
    set -x # start debug mode

    mkdir -p ~/.dotfiles.backup
    mv ~/.[^.]* ~/.dotfiles.backup/
    git clone https://github.com/y9yk/dotfiles.git
    mv dotfiles/* dotfiles/.[^.]* ~
    rmdir dotfiles
    git submodule init
    git submodule update

    # for ubuntu 14.04
    sudo apt-get update
    sudo apt-get install tmux
    
    set +x
}

install() {
    install_env
    install_pyenv
}

case "$1" in
    install) cmd=$1 ;;
    *)
        shift
        echo "usage: $0 [install] [pyenv|env|all]"
        exit 1
esac
shift

for name; do
    case "$name" in
        all) install ;;
        env) install_env ;;
        pyenv) install_pyenv ;;
    esac
done
