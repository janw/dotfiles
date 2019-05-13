
# Setup Pyenv in login shell only
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Setup Poetry in login shell only
if [ -f $HOME/.poetry/env ]; then
    source $HOME/.poetry/env
fi
