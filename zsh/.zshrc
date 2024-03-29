# Less annoying OMZ update reminder frequency
zstyle ':omz:update' frequency 90
export DISABLE_AUTO_UPDATE=true

source "${ZDOTDIR}/zgenom/zgenom.zsh"

# if the init script doesn't exist
if ! zgenom saved; then

  # specify plugins here
  zgenom ohmyzsh
  zgenom ohmyzsh plugins/git
  zgenom ohmyzsh plugins/dotenv
  zgenom ohmyzsh plugins/docker
  zgenom ohmyzsh plugins/docker-compose
  zgenom ohmyzsh plugins/kubectl

  zgenom load zsh-users/zsh-history-substring-search

  # generate the init script from plugins above
  zgenom save

  zgenom compile "$HOME/.zshrc"
  zgenom compile $ZDOTDIR
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
source /Users/jan/.docker/init-zsh.sh || true

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

# Source local environment variations from separate rc file
eval "$(find -L "$HOME" "$ZDOTDIR" \
  -maxdepth 1 \
  -name '.zshrc.local*' \
  -exec echo . \'{}\'';' \;)"
