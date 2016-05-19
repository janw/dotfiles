#!/bin/sh

# Change directory into the repository if called from elsewhere
cd "$(dirname "$0")"
DOTDIR=$(pwd)

echo "Updating Dotfiles. Stashing changes if necessary."
cd "$DOTDIR"
git stash
if git pull --rebase --stat origin master
then
  echo  "Your dotfiles have been updated and/or is at the current version."
else
  echo "There was an error updating. Try again later?"
fi
git stash apply
