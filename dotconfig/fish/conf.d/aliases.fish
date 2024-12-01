alias vimconf "vim ~/.vimrc"
alias upgrade_dotfiles "bash $DOTFILES/tools/upgrade.sh"

# Some hash shortcuts (shasum required)
alias sha256 'shasum -a256'
alias sha512 'shasum -a512'
alias sha1 'shasum -a1'

alias lsblkk 'lsblk -ldo model,size,path,wwn,serial -I8 --sort model'

alias doco 'docker compose'
alias dockerrr 'docker run --rm -it -w "$PWD" -v "$PWD:$PWD"'

alias flush-dns 'sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

alias caff 'caffeinate -di'
alias date-utc 'date -uIseconds'
alias kubens 'DEBUG= command kubens '
alias sops 'EDITOR="code -w" command sops '
alias machine "$PROJECT_HOME/machine/machine"

alias r "cd $PROJECT_HOME"

alias dns 'HTTP3=1 RRTYPE=AAAA VERBOSE=1 command dnslookup'
alias ytd 'yt-dlp -v --remux-video mkv'
