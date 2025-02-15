command -v asdf > /dev/null || exit 0

if test -e "$HOMEBREW_HOME/opt/asdf/libexec/asdf.fish"
    source "$HOMEBREW_HOME/opt/asdf/libexec/asdf.fish"
end
