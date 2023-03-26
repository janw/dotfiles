# Inspired by https://github.com/jorgebucaran/pyenv (archived)

status --is-interactive || exit
command -v pyenv 1>/dev/null || exit
set -l pyenv_root ""

if test -z "$PYENV_ROOT"
    set pyenv_root ~/.pyenv
    set -x PYENV_ROOT "$pyenv_root"
else
    set pyenv_root "$PYENV_ROOT"
end

if status --is-login
    set -x PATH "$pyenv_root/shims" $PATH
    set -x PYENV_SHELL fish
end

function pyenv
    set command $argv[1]
    set -e argv[1]

    switch "$command"
        case activate deactivate rehash shell
            source (pyenv "sh-$command" $argv|psub)
        case '*'
            command pyenv "$command" $argv
    end
end

command -v pyenv-virtualenv-init 1>/dev/null || exit

source (pyenv virtualenv-init -|psub)

# Override virtualenv hook to only trigger on dir changes
function _pyenv_virtualenv_hook --on-variable PWD
    set -l ret $status

    if [ -n "$VIRTUAL_ENV" ]
        pyenv activate --quiet; or pyenv deactivate --quiet; or true
    else if [ -f ".python-version" ]
        pyenv activate --quiet; or true
    end

    return $ret
end
