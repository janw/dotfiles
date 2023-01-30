if command -v go >/dev/null
    set -gx GOPATH "$HOME/go"
    set -gx GOBIN "$GOPATH/bin"
    set -gx PATH $GOBIN $PATH
end
