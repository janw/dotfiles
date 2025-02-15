command -v rustc > /dev/null || exit 0

if test -e $HOME/.cargo/bin
    set -gx PATH $HOME/.cargo/bin $PATH
end
