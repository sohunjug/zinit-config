# zinit load mafredri/zsh-async
# async_init

# lazyenv-enabled
# async_start_worker lazy -n

lazy_env() {
  export SDKROOT=$(xcrun --show-sdk-path)
  export SDK_PATH=$SDKROOT

  TCLTK=$(brew --prefix tcl-tk)
  export PYTHON_CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl) ${PYTHON_CONFIGURE_OPTS}"
  export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$TCLTK/include' ${PYTHON_CONFIGURE_OPTS}"
  export PYTHON_CONFIGURE_OPTS="--with-tcltk-libs='-L$TCLTK/lib -ltcl8.6 -ltk8.6' ${PYTHON_CONFIGURE_OPTS}"
}

lazy_eval() {
  # eval "$(fasd --init auto)"
  # eval "$(direnv hook zsh)"
  # eval "$(thefuck --alias)"
  evalcache thefuck --alias
  evalcache fasd --init auto
  evalcache direnv hook zsh
}

_pipenv() {
  eval "$(COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE="complete-zsh" pipenv)"
}


load:lazy_pipenv() {
  compdef _pipenv pipenv
}

load:lazy_brew() {
  eval "$(/opt/homebrew/bin/brew shellenv)"
}

# async_job lazy lazy_env

zinit ice id-as'lazy_env' wait'5' atload'lazy_env; unfunction lazy_env'
zinit light zdharma/null

zinit ice id-as'lazy_fzf-tab' wait'0c' atload'enable-fzf-tab'
zinit light zdharma/null

# zinit ice id-as'lazy_eval' wait'0c' atload'lazy_eval'
# zinit light zdharma/null
lazy_eval

lazyload init:lazy_pipenv pip
lazyload init:lazy_pipenv python

lazyload init:lazy_brew brew
# async_register_callback lazy cb

# async_job lazy lazy_env
# async_worker_eval lazy lazy_env
