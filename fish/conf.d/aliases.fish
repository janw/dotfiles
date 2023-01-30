alias vimconf="vim ~/.vimrc"
alias upgrade_dotfiles="bash $DOTFILES/tools/upgrade.sh"

# Some hash shortcuts (shasum required)
alias sha256='shasum -a256'
alias sha512='shasum -a512'
alias sha1='shasum -a1'

alias cask='brew cask'
alias lsblkk='lsblk -ldo model,size,path,wwn,serial -I8 --sort model'

alias doco='docker compose'
alias dockr='docker run --rm -it -v $PWD:/code'

alias flush-dns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

alias caff='caffeinate -di'
alias date-utc='date -uIseconds'
alias kubens='DEBUG= kubens '
alias sops='EDITOR="code -w" sops '
alias machine="$PROJECT_HOME/machine/machine"
