function os_version
    if command -v lsb_release >/dev/null
        lsb_release -a | grep "Release:|Codename:" | awk '{print $2}'
    else if [ -f "/etc/*-release" ]
        cat /etc/*-release
    else if [ -f /etc/issue ]
        cat /etc/issue
    else if command -v system_profiler >/dev/null
        system_profiler SPSoftwareDataType | grep --color=never -oE "System Version:.*"
    end
end
