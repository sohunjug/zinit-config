# zinit load mafredri/zsh-async
# async_init

# async_start_worker lazy -n

lazy_env() {
  export SDKROOT=$(xcrun --show-sdk-path)
  export SDK_PATH=$(xcrun --show-sdk-path)

  export PYTHON_CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl) ${PYTHON_CONFIGURE_OPTS}"
  export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$(brew --prefix tcl-tk)/include' ${PYTHON_CONFIGURE_OPTS}"
  export PYTHON_CONFIGURE_OPTS="--with-tcltk-libs='-L$(brew --prefix tcl-tk)/lib -ltcl8.6 -ltk8.6' ${PYTHON_CONFIGURE_OPTS}"
}

# async_job lazy lazy_env

zinit ice id-as'lazy_env' wait'5' atload'lazy_env; unfunction lazy_env'
zinit light zdharma/null

zinit ice id-as'lazy_fzf-tab' wait'1' atload'enable-fzf-tab'
zinit light zdharma/null
