status --is-interactive || exit
command -v lsd 1>/dev/null || exit

alias lsd="lsd --date '+%Y-%m-%d %T' "
alias l='lsd -l'
alias la='lsd -A'
alias ll='lsd -lA'
