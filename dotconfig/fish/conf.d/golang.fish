command -v go > /dev/null || exit 0

if test -e $HOME/go
    set -gx GOPATH "$HOME/go"
    set -gx GOBIN "$GOPATH/bin"
    set -gx PATH $GOBIN $PATH
end
