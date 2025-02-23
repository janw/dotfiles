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

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
