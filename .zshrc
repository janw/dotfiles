# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export HOSTNAME=$(hostname)
export TERM="xterm-256color"
export WORKON_HOME=~/.envs

# Basic work environment
export EDITOR=vim
export DEFAULT_USER=janwillhaus

# User configuration
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $HOME/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle virtualenvwrapper
antigen bundle dotenv

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
antigen apply

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh key selection (always use ed25519)
# export SSH_KEY_PATH="~/.ssh/id_ed25519"

# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# User specific aliases and functions
alias ll='ls -lah'
alias dig='dig ANY'

# Some hash shortcuts (shasum required)
alias sha256='shasum -a256'
alias sha512='shasum -a512'
alias sha1='shasum -a1'

# Zypper is a damn long word
alias zy='sudo zypper'

# Git shortcuts/aliases
alias glol='git log --oneline --graph --max-count=7 --decorate' #  overwrites plugin's glol!
alias gloll="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" #  re-instates plugin's glol!


# Shell-specific comfort features
set show-all-if-ambiguous on
set completion-ignore-case on

# Avoid homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1

# Custom functions
upgrade_dotfiles () {
    /bin/sh $DOTFILES/upgrade-dotfiles.sh
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
