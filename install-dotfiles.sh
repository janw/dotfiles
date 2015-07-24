#!/bin/bash

# Change directory into the repository if called from elsewhere
cd "$(dirname "$0")"

# Update all submodules 
git submodule init && git submodule update

ln -s .zshrc     $HOME
ln -s .zsh       $HOME
ln -s .oh-my-zsh $HOME
ln -s .vim       $HOME
ln -s .vimrc     $HOME


cd .awesome-terminal-fonts
./install.sh
