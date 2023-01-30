status --is-interactive || exit
command -v pyenv 1>/dev/null || exit

while set pyenv_index (contains -i -- "$HOME/.pyenv/shims" $PATH)
    set -eg PATH[$pyenv_index]
end
set -e pyenv_index
set -gx PATH "$HOME/.pyenv/shims" $PATH
set -gx PYENV_SHELL fish

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
