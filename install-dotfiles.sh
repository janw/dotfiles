#!/bin/sh

# Change directory into the repository if called from elsewhere
cd "$(dirname "$0")"
DOTDIR=$(pwd)

# Update all submodules
git submodule init && git submodule update

# Create symlinks into the home dir to enable usage of the files
ln -s $DOTDIR/.oh-my-zsh $HOME
ln -s $DOTDIR/.zshrc     $HOME
ln -s $DOTDIR/.zsh       $HOME
ln -s $DOTDIR/.vim       $HOME
ln -s $DOTDIR/.vimrc     $HOME

# Move into font directory
cd .awesome-terminal-fonts/patched

# Copy font to library and clear font cache for user fonts
if [ "$(uname)" = "Darwin" ]
then
    cp SourceCodePro+Powerline+Awesome+Regular.* ~/Library/Fonts/
    atsutil databases -remove

    open $DOTDIR/Solarized\ Dark\ SourceCodePro\ Powerline.terminal
    open $DOTDIR/Solarized\ Light\ SourceCodePro\ Powerline.terminal
else
    mkdir -p ~/.fonts
    cp -f SourceCodePro+Powerline+Awesome+Regular.* ~/.fonts
    fc-cache -fv ~/.fonts
    echo "Remember to change the console font accordingly!"
fi

# Finally change shell
chsh -s $(which zsh) 

