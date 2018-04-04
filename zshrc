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

source $HOME/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle dotenv

# Bundles from third-party sources
antigen bundle zsh-users/zsh-syntax-highlighting

# Final steps ...
antigen theme andrepolischuk/neat
antigen apply
export RPROMPT=''

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh key selection (always use ed25519)
# export SSH_KEY_PATH="~/.ssh/id_ed25519"

# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconf="vim ~/.zshrc"
alias vimconf="vim ~/.vimrc"

# User specific aliases and functions
alias ll='ls -lah'

# Some hash shortcuts (shasum required)
alias sha256='shasum -a256'
alias sha512='shasum -a512'
alias sha1='shasum -a1'

# Zypper is a damn long word
alias zy='sudo zypper'
alias undisk='diskutil unmountdisk'
alias lsdisk='diskutil list'

# Git shortcuts/aliases
alias glol='git log --oneline --graph --max-count=7 --decorate' #  overwrites plugin's glol!
alias gloll="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" #  re-instates plugin's glol!
alias gbage="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset);%(color:yellow)%(refname:short)%(color:reset);(%(color:green)%(committerdate:relative)%(color:reset));%(authorname);%(contents:subject)' | column -t -s ';'"
alias grepos="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '[ -d {}/.git ] && (echo {} && cd {} && git status -s && echo)' \;"


# Shell-specific comfort features
set show-all-if-ambiguous on
set completion-ignore-case on

# Avoid homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1

# Custom functions
upgrade_dotfiles () {
    echo "Updating Dotfiles. Stashing changes if necessary."
    cd "$DOTFILES"
    git pull --rebase
}

note () {
    # note-taking
    NOTES_FOLDER="$HOME/Dropbox/Notes/"
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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# pyenv-virtualenv
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
if [[ $(local_hostname) =~ hs\-woe\.de  && $(local_session) == local ]]
then
    echo "You're at work. Yay, I guess."
    zeiterf -sd &
fi

