# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export TERM="xterm-256color"

# Basic work environment
export EDITOR=vim

# Work around OS-different versions of `hostname`
local_hostname () {
    echo $(hostname -A 2> /dev/null || hostname -F 2> /dev/null || hostname) | tail -n1
}

# Determine if session is remote or local
local_session () {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo "remote"
    else
        echo "local"
    fi
}

source $DOTFILES/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle dotenv
antigen bundle docker
antigen bundle docker-compose
antigen bundle kubectl
antigen bundle helm
antigen bundle sublime
antigen bundle httpie

# Bundles from third-party sources
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle Tarrasch/zsh-autoenv

# Final steps ...
antigen theme andrepolischuk/neat
antigen apply
export RPROMPT=''
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=053'

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Shell-specific comfort features
set show-all-if-ambiguous on
set completion-ignore-case on

# Avoid homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Custom functions
upgrade_dotfiles () {
    echo "Updating Dotfiles. Stashing changes if necessary."
    cd "$DOTFILES"
    git pull --rebase
}

note () {
    # note-taking
    NOTES_FOLDER="$HOME/Nextcloud/Documents/Notes/"
    fname=$(date "+%Y-%m-%d %H%M%S")
    vim -c "put='# '" -c 'start!' -- "$NOTES_FOLDER/note_${fname}.md"
}

subl () {
    setopt +o nomatch
    files=`ls -1 *.sublime-project 2>/dev/null`
    setopt -o nomatch

    nfiles=`echo $files | wc -l`
    if [ $# -eq 0 ] && [ $nfiles -eq 1 ]
    then
        command subl --project "$files"
    else
        command subl "$@"
    fi
}

os_version () {
    #
    if hash lsb_release 2>/dev/null; then
        lsb_release -a | grep "Release:|Codename:" | awk '{print $2}'
    fi

    if [ -f "/etc/issue" ]; then
        cat /etc/issue
    fi

    if [ -f "/etc/*-release" ]; then
        cat /etc/*-release
    fi

    if hash system_profiler 2>/dev/null; then
        system_profiler SPSoftwareDataType | grep "System Version:"
    fi
}

# Source a few more tools/settings
source $DOTFILES/zsh/python.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/tools.zsh

# Source local environment variations from separate rc file
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# Launch into a screen session when connecting via ssh
if [ -z "$STY" ] && ([ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]) && [[ "$-" =~ "i" ]]; then
    echo "Would launch screen …"
    #exec screen -q -Rd;
fi

