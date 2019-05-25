
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=253,fg=246'

# Theme of choice: https://github.com/denysdovhan/spaceship-prompt
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  docker        # Docker section
  venv          # virtualenv section
  pyenv         # Pyenv section
  kubecontext   # Kubectl context section
  line_sep      # Line break
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  exit_code     # Exit code section
  exec_time     # Execution time
  time          # Time stamps section
  jobs          # Background jobs indicator
)
SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_GIT_PREFIX=""
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_TIME_SHOW=true

# Theme of choice: https://github.com/caiogondim/bullet-train.zsh
BULLETTRAIN_PROMPT_ORDER=(
  context
  dir
  git
  virtualenv
  status
)

BULLETTRAIN_CONTEXT_DEFAULT_USER=jan
BULLETTRAIN_PROMPT_CHAR="❯"
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_IS_SSH_CLIENT=$SESSION_TYPE_SSH
BULLETTRAIN_CONTEXT_BG=magenta
BULLETTRAIN_CONTEXT_FG=white
BULLETTRAIN_KCTX_KCONFIG=$HOME/.kube/config

