export VIRTUAL_ENV_DISABLE_PROMPT=1

if [ ! -n "${POETRY_ACTIVE+1}" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi
fi

# Automatically activate pipenv shell, when cd'ing into a "pipenv'ed" dir
function auto_python_env {
    if grep -sq "poetry" "pyproject.toml" && [ ! -n "${POETRY_ACTIVE+1}" ]; then
        designated_venv="$(dirname `poetry run which python`)"
        export POETRY_ACTIVE=1
    elif [ -f "Pipfile" ] && [ ! -n "${PIPENV_ACTIVE+1}" ]; then
        designated_venv="$(dirname `pipenv run which python`)"
    elif [ -d "venv" ] && [ -z "${VIRTUAL_ENV}" ]; then
        designated_venv="${PWD}/venv/bin"
    elif [ -d ".venv" ] && [ -z "${VIRTUAL_ENV}" ]; then
        designated_venv="${PWD}/.venv/bin"
    fi
    if [ ! -z "${designated_venv}" ]; then
        source ${designated_venv}/activate
    fi
}

# Override cd command to include automatic venv activation
function cd {
    builtin cd "$@"
    auto_python_env
}

# Output the current python environment for Poetry, Pipfile, Venv
function print_python_env {
    if [ -n "${POETRY_ACTIVE+1}" ] && [ -z "${VIRTUAL_ENV}" ]; then
        unset POETRY_ACTIVE
    fi
    if [ -n "${POETRY_ACTIVE+1}" ]; then
        echo "🐍 %{$fg[blue]%}Poetry%{$reset_color%}"
    elif [ -n "${PIPENV_ACTIVE+1}" ]; then
        echo "🐍 %{$fg[blue]%}Pipenv%{$reset_color%}"
    elif [ ! -z "${VIRTUAL_ENV}" ]; then
        echo "🐍 %{$fg[blue]%}Venv%{$reset_color%}"
    fi
}
RPROMPT=' $(print_python_env)'


source $HOME/.poetry/env
fpath+=~/.zfunc
compinit
