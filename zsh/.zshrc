# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export TERM="xterm-256color"

# Basic work environment
export EDITOR=vim
export PROJECT_HOME=$HOME/repos

# source $DOTFILES/antigen/antigen.zsh
source "${ZDOTDIR}/zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/dotenv
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/kubectl

  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-history-substring-search

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
export WORDCHARS=

# Avoid homebrew from sending analytics
export HOMEBREW_NO_ANALYTICS=1

# Source a few more tools/settings
source $ZDOTDIR/theming.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/tools.zsh

# shellcheck disable=SC1090
[[ -f "$ZDOTDIR/.p10k.zsh" ]] && source "$ZDOTDIR/.p10k.zsh"

# Source local environment variations from separate rc file
eval "$(find -L "$HOME" "$ZDOTDIR" \
  -maxdepth 1 \
  -name '.zshrc.local*' \
  -exec echo . \'{}\'';' \;)"

# Hint about screen
if [[ -n $SESSION_TYPE_SSH ]]; then
  echo "Computering on a remote machine? Might wanna screen that."
fi
