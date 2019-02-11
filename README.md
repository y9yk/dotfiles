# Dotfiles

My dotfiles referring to [Lucy's dotfiles](https://github.com/e9t/dotfiles).
I've activated only the option I'm currently using.

## Requirements


## Installation

```
# backup previous dotfiles
mkdir -p ~/.dotfiles.backup
mv ~/.[^.]* ~/.dotfiles.backup/

# get new dotfiles
git clone https://github.com/y9yk/dotfiles.git
mv dotfiles/* dotfiles/.[^.]* ~
rmdir dotfiles
git submodule init
git submodule update
```

## Features

## License

You're free to use anything I did to this repo, but please respect others' licenses within.
