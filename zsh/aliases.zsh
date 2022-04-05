
# For a full list of active aliases, run `alias`.
#
alias zshconf="vim ~/.zshrc"
alias zresrc="source ~/.zshrc"
alias vimconf="vim ~/.vimrc"
alias upgrade_dotfiles="bash $DOTFILES/tools/upgrade.sh"

# User specific aliases and functions
alias ll='ls -lah'

# Some hash shortcuts (shasum required)
alias sha256='shasum -a256'
alias sha512='shasum -a512'
alias sha1='shasum -a1'

# Zypper is a damn long word
alias zy='sudo zypper'
alias undisk='diskutil unmountdisk'
alias lsdisk='diskutil list'
alias cask='brew cask'
alias lsblkk='lsblk -ldo model,size,path,wwn,serial -I8 --sort model'

# Git shortcuts/aliases
git_janw_default_branch() {
    # Expects OMZ git.plugin to be enabled for the git_main_branch function to exist
    default_branch="$(command git config janw.default-branch || git_main_branch)"
    echo "Default branch: $default_branch" >&2
    echo "$default_branch"
}

alias glol='git log --oneline --max-count=15 --decorate' #  overwrites plugin's glol!
alias gam='git commit --amend '  # overwrites plugin's gam (git am)
alias gloll="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" #  re-instates plugin's glol!
alias gbage="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset);%(color:yellow)%(refname:short)%(color:reset);(%(color:green)%(committerdate:relative)%(color:reset));%(authorname);%(contents:subject)' | column -t -s ';'"
alias gbral="git for-each-ref --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset) ; %(align:36)%(authorname) (%(color:green)%(committerdate:relative)%(color:reset))%(end) ; %(color:yellow)%(align:64)%(refname:short)%(end)%(color:reset) ; %(contents:subject)' "
alias grepos="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '[ -d {}/.git ] && (echo {} && cd {} && git status -s && echo)' \;"
alias gtl="git tag --format=\"%(align:12)%(color:bold green)%(refname:strip=2)%(end) %(align:12)%(color:red)%(objectname:short)%(end) %(color:reset)%(authordate:short)  (%(authordate:relative))\""
alias gpu='git pull'
alias gcom='git checkout $(git_janw_default_branch) '
alias gcmp='gcom && git pull'
alias gfm='git fetch origin $(git_janw_default_branch) '
alias gfrm='gfm && git rebase origin/$(git_janw_default_branch) '
alias gstartb='gcom && git pull origin $(git_janw_default_branch) && git checkout -b'
alias ggrep='git rev-list --all | xargs git grep'
alias gampf='gam --no-edit && gpf'
alias gmsg='git log --format=%B -n 1'

# Kubernetes shortcuts
alias kcontext='kubectl config set-context $(kubectl config current-context) --namespace'

alias codeclimate='docker run --interactive --tty --rm --env CODECLIMATE_CODE="$PWD" --volume "$PWD":/code --volume /var/run/docker.sock:/var/run/docker.sock --volume /tmp/cc:/tmp/cc codeclimate/codeclimate'

alias ydl='youtube-dl'

alias ydl-chan='youtube-dl -o "/mnt/alpha/media/youtube/%(uploader)s [%(channel_id)s]/%(playlist_index)03d %(upload_date)s %(title)s [%(id)s].%(ext)s" --playlist-reverse --download-archive="/mnt/alpha/media/youtube/archive.txt"'

alias ydl-mov='youtube-dl -o "/mnt/alpha/media/youtube_movies/%(uploader)s [%(channel_id)s]/%(title)s [%(id)s].%(ext)s" --download-archive="/mnt/alpha/media/youtube_movies/archive.txt"'

alias doco='docker-compose'
alias dockr='docker run --rm -it -v $PWD:/code'

alias flush-dns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'
