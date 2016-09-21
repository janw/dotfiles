#!/bin/sh

# Change directory into the repository if called from elsewhere
cd "$(dirname "$0")"
DOTDIR=$(pwd)

# Update all submodules
git submodule init && git submodule update

# Create symlinks into the home dir to enable usage of the files
ln -sf $DOTDIR/.oh-my-zsh $HOME
ln -sf $DOTDIR/.zshrc     $HOME
ln -sf $DOTDIR/.zsh       $HOME
ln -sf $DOTDIR/.vim       $HOME
ln -sf $DOTDIR/.vimrc     $HOME
ln -sf $DOTDIR/.tmux.conf $HOME
ln -sf $DOTDIR/.atom      $HOME

# Link font to library and clear font cache for user fonts
if [ "$(uname)" = "Darwin" ]
then

    ln -s $DOTDIR/.awesome-terminal-fonts/patched/*.sh $HOME/Library/Fonts/
    ln -s $DOTDIR/.awesome-terminal-fonts/patched/*.ttf $HOME/Library/Fonts/
    atsutil databases -remove

else
    mkdir -p $HOME/.local/share/fonts
    ln -s $DOTDIR/.awesome-terminal-fonts/patched/*.sh $HOME/.local/share/fonts
    ln -s $DOTDIR/.awesome-terminal-fonts/patched/*.ttf $HOME/.local/share/fonts

    fc-cache -f
    echo "Remember to change the console font accordingly!"
fi

# Finally change shell
chsh -s $(which zsh)


