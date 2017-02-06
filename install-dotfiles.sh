#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


# Change directory into the repository if called from elsewhere
cd "$(dirname "$0")"
DOTDIR=$(pwd)

# Update all submodules
git submodule init && git submodule update

echo -e "\n\nSymlinking configs, rc files, etc. ..."
# Create symlinks into the home dir to enable usage of the files
ln -sf $DOTDIR/.oh-my-zsh $HOME
ln -sf $DOTDIR/.zshrc     $HOME
ln -sf $DOTDIR/.zsh       $HOME
ln -sf $DOTDIR/.vim       $HOME
ln -sf $DOTDIR/.vimrc     $HOME
#ln -sf $DOTDIR/.tmux.conf $HOME
ln -sf $DOTDIR/.atom      $HOME
ln -sf $DOTDIR/.i3        $HOME
ln -sf $DOTDIR/.compton.conf $HOME

# X server files
ln -sf $DOTDIR/.Xdefaults        $HOME
ln -sf $DOTDIR/.Xresources.light $HOME
ln -sf $DOTDIR/.Xresources.dark  $HOME

# Emacs.d directory
ln -sf $DOTDIR/.emacs.d          $HOME


# Setup git config
echo -e "\n\nSetting up global git config ..."
git config --global include.path "${DOTDIR}/gitconfig_global"
git config --global core.excludesfile "${DOTDIR}/gitignore_global"
git config --global core.attributesfile "${DOTDIR}/gitattributes_global"

# Show the entire config just to be sure
git config -l


echo -e "\n\nDownloading additional fonts ..."
# Download a fonts from the web and install them.

wget -nc "https://github.com/belluzj/fantasque-sans/releases/download/v1.7.1/FantasqueSansMono.zip"
unzip -n FantasqueSansMono.zip -d fantasquesans 2>&1 > /dev/null


# Link font to library and clear font cache for user fonts
if [ "$(uname)" = "Darwin" ]
then
    echo -e "\n\nWe're on macOS."

    echo "Linking fonts ..."
    ln -sf $DOTDIR/fantasquesans/OTF/*.otf $HOME/Library/Fonts/

    echo "Refreshing font cache ..."
    atsutil databases -remove

else
    echo -e "\n\nWe're on Linux. "
    mkdir -p $HOME/.fonts/
    mkdir -p $HOME/.config/fontconfig/conf.d/


    echo "Linking fonts ..."
    ln -sf $DOTDIR/fantasquesans/OTF/*.otf $HOME/.fonts

    echo "Refreshing font cache ..."
    #fc-cache -f

    echo "Remember to change the console font accordingly!"
fi

SHELLPATH=$(getent passwd $LOGNAME | cut -d: -f7)
# Finally change shell if necessary
if [[ $SHELLPATH =~ zsh$ ]]
then
    echo "Shell is already zsh. Done."
else
    chsh -s $(which zsh)
fi
