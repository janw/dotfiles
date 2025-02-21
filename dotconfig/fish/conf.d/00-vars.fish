set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

set -gx DOTFILES $HOME/.dotfiles
set -gx TERM xterm-256color

set -gx EDITOR vim
set -gx PROJECT_HOME $HOME/repos

if test -e $HOME/.bin
    set -gx PATH $HOME/.bin $PATH
end
if test -e $HOME/bin
    set -gx PATH $HOME/bin $PATH
end

set -gx LESSHISTFILE /dev/null
