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
  eval "$(fasd --init auto)"
  eval "$(direnv hook zsh)"
  eval "$(thefuck --alias)"
  eval "$($BREW_PREFIX/bin/brew shellenv)"
  # evalcache thefuck --alias
  # evalcache fasd --init auto
  # evalcache direnv hook zsh
}

_pipenv() {
  eval "$(COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE="complete-zsh" pipenv)"
}


lazy_pipenv() {
  compdef _pipenv pipenv
}

# async_job lazy lazy_env

zinit ice id-as'lazy_env' wait'2' atload'lazy_env; unfunction lazy_env'
zinit light zdharma/null

zinit ice id-as'lazy_fzf-tab' wait'0c' atload'enable-fzf-tab'
zinit light zdharma/null

zinit ice id-as'lazy_eval' wait'0c' atload'lazy_eval; unfunction lazy_eval'
zinit light zdharma/null
# lazy_eval

lazyload python python3 pip -- 'lazy_pipenv'

# async_register_callback lazy cb

# async_job lazy lazy_env
# async_worker_eval lazy lazy_env
