function os_version
    if hash lsb_release 2>/dev/null
        lsb_release -a | grep "Release:|Codename:" | awk '{print $2}'
    else if [ -f /etc/issue ]
        cat /etc/issue
    else if [ -f "/etc/*-release" ]
        cat /etc/*-release
    else if hash system_profiler 2>/dev/null
        system_profiler SPSoftwareDataType | grep --color=never -oE "System Version:.*"
    end
end
