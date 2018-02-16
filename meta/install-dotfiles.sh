#!/bin/bash
set -eo pipefail
IFS=$'\n\t'

# The following section only applies on local sessions
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    SESSION_TYPE=remote
else
    SESSION_TYPE=local
fi

set -u

if [[ $SESSION_TYPE == "local" ]]; then

    echo -e "\n\nDownloading additional fonts ..."
    # Download a fonts from the web and install them.

    wget -nc "https://github.com/belluzj/fantasque-sans/releases/download/v1.7.1/FantasqueSansMono.zip"
    unzip -n FantasqueSansMono.zip -d fantasquesans 2>&1 > /dev/null

    echo -e "\n\nLinking fonts ..."
    # Link font to library and clear font cache for user fonts
    if [ "$(uname)" = "Darwin" ]
    then
        echo -e "We're on macOS."

        ln -sf $DOTDIR/fantasquesans/OTF/*.otf $HOME/Library/Fonts/

        echo "Refreshing font cache ..."
        atsutil databases -remove

    else
        echo -e "We're on Linux. "
        mkdir -p $HOME/.fonts/
        mkdir -p $HOME/.config/fontconfig/conf.d/

        ln -sf $DOTDIR/fantasquesans/OTF/*.otf $HOME/.fonts

        echo "Refreshing font cache ..."
        #fc-cache -f
    fi

fi

echo -e "\n\nChanging shell to the one and only zsh ..."
MYSHELL=${SHELL:-}
# Finally change shell if necessary
if [[ $MYSHELL =~ zsh$ ]]; then
    echo "Shell is already zsh. Done."
else
    chsh -s $(which zsh)
fi
