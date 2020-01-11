
# For a full list of active aliases, run `alias`.
#
alias zshconf="vim ~/.zshrc"
alias zresrc="source ~/.zshrc"
alias vimconf="vim ~/.vimrc"

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
alias ydl='youtube-dl --format "(bestvideo[height<=?1080]+bestaudio/best)" -o "~/Downloads/%(title)s [%(id)s].%(ext)s"'

# Git shortcuts/aliases
alias glol='git log --oneline --graph --max-count=7 --decorate' #  overwrites plugin's glol!
alias gloll="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" #  re-instates plugin's glol!
alias gbage="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset);%(color:yellow)%(refname:short)%(color:reset);(%(color:green)%(committerdate:relative)%(color:reset));%(authorname);%(contents:subject)' | column -t -s ';'"
alias grepos="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '[ -d {}/.git ] && (echo {} && cd {} && git status -s && echo)' \;"
alias gtl="git tag --format=\"%(align:12)%(color:bold green)%(refname:strip=2)%(end) %(align:12)%(color:red)%(objectname:short)%(end) %(color:reset)%(authordate:short)  (%(authordate:relative))\""
alias gpu='git pull'
alias gcom="git checkout master"
alias gcmp="git checkout master && git pull"
alias gfrm='git fetch && git rebase origin/master'
alias gstartb='git checkout master && git pull origin master && git checkout -b'

# Kubernetes shortcuts
alias kcontext='kubectl config set-context $(kubectl config current-context) --namespace'

alias codeclimate='docker run --interactive --tty --rm --env CODECLIMATE_CODE="$PWD" --volume "$PWD":/code --volume /var/run/docker.sock:/var/run/docker.sock --volume /tmp/cc:/tmp/cc codeclimate/codeclimate'
