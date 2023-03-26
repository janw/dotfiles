set -l platform (uname -s)
set -l arch (uname -p)
set -l HOMEBREW_HOME /usr/local


if [ "$platform" = Linux ]
    set HOMEBREW_HOME /home/linuxbrew/.linuxbrew
else if [ "$platform" = Darwin ]
    if [ "$arch" = arm ]
        set HOMEBREW_HOME /opt/homebrew
        alias oldbrew=/usr/local/bin/brew
    end
else
    echo "Unsupported platform for homebrew: $platform"
    exit 1
end

set -gx PATH "$HOMEBREW_HOME/bin" $PATH

if test -d "$HOMEBREW_HOME/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path $HOMEBREW_HOME/share/fish/completions
end

if test -d "$HOMEBREW_HOME/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path $HOMEBREW_HOME/share/fish/vendor_completions.d
end
