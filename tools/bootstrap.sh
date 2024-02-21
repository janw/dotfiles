#!/usr/bin/env bash
set -o pipefail

echo_color() {
  local color="$1"
  shift
  tput setaf "$color"
  echo -e "$1"
  tput sgr0
}

section() {
  echo
  tput bold
  echo_color 2 "===== $1 ====="
}

info() {
  echo_color 4 "$1"
}

skipped() {
  info "[skipped]"
}

command_is_missing() {
  ! command -v "$1" >/dev/null
}

section "Creating dummy git local config"
if [ ! -f "dotconfig/git/config.local" ]; then
  touch dotconfig/git/config.local
else
  skipped
fi

section "Installing homebrew"
if command_is_missing brew; then
  set -e
  mkdir -p tmp/homebrew-installer
  cd tmp/homebrew-installer
  git clone https://github.com/Homebrew/install.git . ||
    git pull origin HEAD
  bash install.sh
else
  skipped
fi

section "Installing tools from Brewfile"
brew bundle --no-lock install Brewfile

section "Installing asdf-managed languages"
if command_is_missing asdf; then
  brew install asdf
fi
asdf plugin-add python
asdf plugin-add nodejs
asdf plugin-add direnv
asdf install

section "✔️ Done"
echo ""