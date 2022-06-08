# Setup Pyenv if it's installed, including pyenv-virtualenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="${PYENV_ROOT}/shims:${PATH}"
  eval "$(pyenv init -)"

  if command -v pyenv-virtualenv-init 1>/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# Setup Poetry in login shell only
if [ -f $HOME/.poetry/env ]; then
  source $HOME/.poetry/env
fi

# Created by `userpath` on 2019-08-01 09:03:32
export PATH="$PATH:/Users/jan/.local/bin"

# Source local environment variations from separate profile
if [ -e "$HOME/.zprofile.local" ]; then
  . $HOME/.zprofile.local
fi
