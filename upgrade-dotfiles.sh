
cd "$(dirname "$0")"
echo "Updating Dotfiles. Stashing changes if necessary."
git fetch origin master
git rebase FETCH_HEAD --stat --autostash
