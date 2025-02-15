command -v brew > /dev/null || exit 0

set -l platform (uname -s)
set -l arch (uname -p)
set -gx HOMEBREW_HOME /usr/local


if [ "$platform" = Linux ]
    set HOMEBREW_HOME /home/linuxbrew/.linuxbrew
else if [ "$platform" = Darwin ]
    if [ "$arch" = arm ]
        set HOMEBREW_HOME /opt/homebrew
    end
else
    echo "Unsupported platform for homebrew: $platform"
    exit 1
end

test -e $HOMEBREW_HOME/bin/brew || exit 0

set -gx PATH "$HOMEBREW_HOME/bin" $PATH
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK 1

if [ $HOMEBREW_HOME != /usr/local ] && [ -e /usr/local/bin/brew ]
    alias oldbrew=/usr/local/bin/brew
end

if test -d "$HOMEBREW_HOME/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path $HOMEBREW_HOME/share/fish/completions
end

if test -d "$HOMEBREW_HOME/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path $HOMEBREW_HOME/share/fish/vendor_completions.d
end
