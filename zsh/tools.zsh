
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
    alias l='lsd -l'
    alias ll='lsd -la'
    alias la='lsd -a'
    alias lla='lsd -la'
    alias lt='lsd --tree'
fi
