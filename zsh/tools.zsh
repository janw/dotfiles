confirm_input () {
    read -k 1 -r "input?Are you sure? [y/N] "
    case $input in
        [yY][eE][sS]|[yY])
        return 0
        ;;
        *)
        return 1
        ;;
    esac
}

# Work around OS-different versions of `hostname`
local_hostname () {
    echo $(hostname -A 2> /dev/null || hostname -F 2> /dev/null || hostname) | tail -n1
}

# Determine if session is remote or local
local_session () {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo "remote"
    else
        echo "local"
    fi
}

os_version () {
    if hash lsb_release 2>/dev/null; then
        lsb_release -a | grep "Release:|Codename:" | awk '{print $2}'
    fi

    if [ -f "/etc/issue" ]; then
        cat /etc/issue
    fi

    if [ -f "/etc/*-release" ]; then
        cat /etc/*-release
    fi

    if hash system_profiler 2>/dev/null; then
        system_profiler SPSoftwareDataType | grep "System Version:"
    fi
}

bundleid () { echo "id of app \"$@\" " | osascript }
sssh () { ssh -t "$@" screen -q -Rd }

# Alias LSDeluxe over ls if present
if command  -v lsd 1>/dev/null 2>&1; then
    alias lsd="lsd --date '+%Y-%m-%d %T' "
    alias l='lsd -l'
    alias ll='lsd -lA'
    alias la='lsd -A'
    alias lt='lsd --tree'
fi

if command -v trash >/dev/null; then
    alias trm='trash'
fi

if test -x "$HOME/repos/machine/machine"; then
    alias machine="$HOME/repos/machine/machine"
fi

if command -v go >/dev/null; then
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    export PATH="$GOBIN:$PATH"
fi
compdef _git gstart=git-checkout

fixcask () {
    local targetcask="$1"
    local reinstall_args=("${@:2}")
    [ -z "$targetcask" ] && return
    brew cask info "$targetcask" || return

    echo -e "\nThis will remove $targetcask from the Caskroom and reinstall it."
    confirm_input || return
    rm -rfv "$(brew --prefix)/Caskroom/$targetcask"
    brew cask reinstall "$targetcask" $reinstall_args
}

retry () {
    while ! zsh --pipefail -e -i -c "$@"
    do
        echo "Retrying"
        sleep 2
    done
}


toggle-flake8-user-conf () {
    if [ -f "$HOME/.config/flake8" ]; then
        mv "$HOME/.config/flake8"{,.bak} && echo disabled
    else
        mv "$HOME/.config/flake8"{.bak,} && echo enabled

    fi
}

: ${ZSH_DOTENVLOCAL_FILE:=.env.local}

source_envlocal() {
  if [[ ! -f "$ZSH_DOTENVLOCAL_FILE" ]]; then
    return
  fi

  # test .env syntax
  zsh -fn $ZSH_DOTENVLOCAL_FILE || {
    echo "dotenv: error when sourcing '$ZSH_DOTENVLOCAL_FILE' file" >&2
    return 1
  }

  setopt localoptions allexport
  source $ZSH_DOTENVLOCAL_FILE
}

autoload -U add-zsh-hook
add-zsh-hook chpwd source_envlocal

source_envlocal

slugify() {
    echo "$1" |
        iconv -t ascii//TRANSLIT |
        sed -E \
            -e 's/[~\^]+//g' \
            -e 's/[^a-zA-Z0-9]+/-/g' \
            -e 's/^-+\|-+$//g' \
            -e 's/-$//g' \
            -e 's/^-//g' |
        tr A-Z a-z
}

docker_image_name_from_git() {
    local image_name
    local image_tag
    local full_name
    image_name=$(slugify $(basename $(git rev-parse --show-toplevel)))
    image_tag=$(slugify $(git rev-parse --abbrev-ref HEAD))

    echo "${image_name}:${image_tag}"
}

alias gitimgname='docker_image_name_from_git'
