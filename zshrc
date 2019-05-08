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

# source $DOTFILES/antigen/antigen.zsh
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/dotenv
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/kubectl
  zgen oh-my-zsh plugins/helm
  zgen oh-my-zsh plugins/httpie

  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions

  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  # generate the init script from plugins above
  zgen save
fi


# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Shell-specific comfort features
set show-all-if-ambiguous on
set completion-ignore-case on
export HISTSIZE=1000
export SAVEHIST=1000

# Avoid homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Working environment for python
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
export PROJECT_HOME=$HOME/repos

# Source a few more tools/settings
source $DOTFILES/zsh/theming.zsh
source $DOTFILES/zsh/aliases.zsh
source $DOTFILES/zsh/tools.zsh

# Source local environment variations from separate rc file
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# Hint about screen
if [ -z "$STY" ] && ([ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]) && [[ "$-" =~ "i" ]]; then
    echo "Computering on a remote machine? Might wanna screen that."
fi
