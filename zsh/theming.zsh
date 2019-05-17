
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='bg=253,fg=246'

# Theme of choice: https://github.com/caiogondim/bullet-train.zsh
BULLETTRAIN_PROMPT_ORDER=(
  dir
  git
  context
  virtualenv
  status
)

BULLETTRAIN_CONTEXT_DEFAULT_USER=jan
BULLETTRAIN_PROMPT_CHAR="❯"
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_IS_SSH_CLIENT=$SESSION_TYPE_SSH