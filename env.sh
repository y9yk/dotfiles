#!/bin/bash
# Author : y9yk
# Usage:
#
#   http://bit.ly/envshy9yk
#   bash envysh9yk install all
# -----------------------------------------------

set -euo pipefail

# ------------------------------
# command
# ------------------------------

# ------------------------------
# variables
# ------------------------------
home="$HOME"
bckp="$home/dotfiles.backup"

# ------------------------------
# functions
# ------------------------------
install_pyenv() {
    echo '---------------'
    echo ' pyenv install '
    echo '---------------'
    set -x # start debug mode 
    # pyenv, pyenv-virtualenv installation
    curl https://pyenv.run | bash
    set +x
}

install_env() {
    echo '------------------------'
    echo ' environment setting-up '
    echo '------------------------'
    set -x # start debug mode

    if [ ! -d "$bckp" ] ; then
        mkdir -p "$bckp"
        mv $home/.[^.]* $bckp/
    fi
    git clone https://github.com/y9yk/dotfiles.git
    mv dotfiles/* dotfiles/.[^.]* $home/~
    rmdir dotfiles
    git submodule init
    git submodule update

    # for vim-pathogen
    cp $home/.vim/autoload/pathogen.vim $home/.vim/bundle/vim-pathogen/autoload/

    # for ubuntu 14.04
    sudo apt-get update
    sudo apt-get install tmux
    
    set +x
}

install() {
    install_env
    install_pyenv
}

# ------------------------------
# main
# ------------------------------
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
