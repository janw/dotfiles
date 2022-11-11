#!/usr/bin/env bash
set -euo pipefail

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if [ -t 1 ]; then
  RED=$(printf '\033[31m')
  BLUE=$(printf '\033[34m')
  RESET=$(printf '\033[m')
else
  RED=""
  BLUE=""
  RESET=""
fi

cd "$DOTFILES"

printf "${BLUE}%s${RESET}\n" "Updating Dotfiles in $DOTFILES"
if git pull --autostash --stat origin master; then
  status=0

  printf '%s    _                        %s __ %s  _       _    __ _ _               %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s   (_)                      %s / /%s  | |     | |  / _(_) |              %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s    _  __ _ _ ____      __ %s / /%s __| | ___ | |_| |_ _| | ___  ___     %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s   | |/ _` | '"'"'_ \ \ /\ / /%s / /%s / _` |/ _ \| __|  _| | |/ _ \/ __|%s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s   | | (_| | | | \ V  V /%s / /%s | (_| | (_) | |_| | | | |  __/\__ \    %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s   | |\__,_|_| |_|\_/\_/%s /_/%s   \__,_|\___/ \__|_| |_|_|\___||___/    %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s  _/ |                  %s    %s                                         %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf '%s |__/                   %s    %s                                         %s\n' "$BLUE" "$RED" "$BLUE" "$RESET"
  printf "\n${BLUE}%s${RESET}\n\n" 'Hooray! Dotfiles have been updated and/or are at the current version.'
else
  status=$?
  printf "\n${RED}%s${RESET}\n\n" 'There was an error updating. Try again later?'
fi

if [ "$(git diff --diff-filter=U --name-only | wc -l)" -eq 0 ]; then
  printf "${BLUE}%s${RESET}\n" "Checking submodules ..."
  bash "$DOTFILES/tools/prune_submodules.sh"
  printf "${BLUE}%s${RESET}\n" "Running dotbot installer ..."
  bash "$DOTFILES/install"
else
  printf "${RED}%s${RESET}\n" "Skipping dotbot installer due to unmerged changes"
fi

# Exit with `1` if the update failed
exit $status
