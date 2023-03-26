set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

set -gx DOTFILES $HOME/.dotfiles
set -gx TERM xterm-256color

set -gx EDITOR vim
set -gx PROJECT_HOME $HOME/repos

set -gx PATH $HOME/.bin $PATH

set -g FISH_DOTENV_ALLOWLIST "$__fish_config_dir/cache/.dotenv-allowed.list"
set -g FISH_DOTENV_BLOCKLIST "$__fish_config_dir/cache/.dotenv-blocked.list"

set -gx LESSHISTFILE /dev/null
