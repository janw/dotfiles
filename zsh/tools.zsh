
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

ktoken-account () {
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system
EOF
}

ktoken () {
    secret_name=$(kubectl -n kube-system get secret | grep '^admin-user-' | awk '{print $1}')
    if [ -z "$secret_name" ]; then
        echo "No admin-user account available. Run ktoken-account first."
        return 1
    fi
    kubectl -n kube-system describe secret "$secret_name" | grep token: | awk '{printf $2}' | pbcopy
    echo "Copied token to clipboard."
}

gstart () {
    git checkout master && git pull origin master
    git checkout $1 2>/dev/null || git checkout -b $1
}
alias __git-checkout_main=_git_checkout
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
