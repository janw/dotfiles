
# Setup Pyenv in login shell only
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  if command -v pyenv-virtualenv-init 1>/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)";
  fi
fi

# Setup Poetry in login shell only
if [ -f $HOME/.poetry/env ]; then
    source $HOME/.poetry/env
fi

# Detect session type to be remote`
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export SESSION_TYPE_SSH=1
# many other tests omitted
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) export SESSION_TYPE_SSH=1;;
  esac
fi

# Created by `userpath` on 2019-08-01 09:03:32
export PATH="$PATH:/Users/jan/.local/bin"

# Source local environment variations from separate profile
if [ -e "$HOME/.zprofile.local" ]; then
 . $HOME/.zprofile.local
fi
