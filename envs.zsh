
ARCH="$(uname -m)"
if [[ "${ARCH}"  == "arm64" ]]; then
  BREW_PREFIX="/opt/homebrew"
else
  BREW_PREFIX="/usr/local"
fi

PREFIX="$BREW_PREFIX/opt"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1  # make prompt faster
DISABLE_MAGIC_FUNCTIONS=true
ZSH_EVALCACHE_DIR=$HOME/.cache/zsh-eval

export DISABLE_LS_COLORS=true
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$HOME/.asdf/installs/python/3.9.6/bin/python3
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export CMAKE_HOME_DIRECTORY=$BREW_PREFIX/bin/cmake
#####################
# ENV VARIABLE      #
#####################
export EDITOR=nvim
export VISUAL=$EDITOR
export PAGER=less
export SHELL=$BREW_PREFIX/bin/zsh
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export BAT_THEME=gruvbox-dark

# export ARCHFLAGS="-arch x86_64"

export SSH_KEY_PATH="~/.ssh/rsa_id"

export MACOSX_DEPLOYMENT_TARGET=12.0

export HOMEBREW_GITHUB_API_TOKEN="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"
export BW_SESSION="SbtiumkEOj/LexAajEId1UDNF5Dx2b32vHC//kgx7+zZvMROfEREdxiR5PjScYIvOZ9we7xW2G22yAJfN1H0tQ=="

export PATH="$BREW_PREFIX/opt/qt/bin:$PATH"

export GEOVIM_PATH="$HOME/.config/nvim/geovim"
export GEOVIM_EDITOR="nvim" # Set to "vim" to use Vim
export GEOVIM_TMUX=0 # Set to 0 to disable TMUX
export GEOVIM_TERM="alacritty"
# export GEOVIM_TERM="kitty"
source "$GEOVIM_PATH/geovim.sh"

PS1='$(show_virtual_env)'$PS1

ZLIB="${PREFIX}/zlib"
BZIP2="${PREFIX}/bzip2"
READLINE="${PREFIX}/readline"
SQLITE="${PREFIX}/sqlite"
OPENSSL="${PREFIX}/openssl@1.1"
FFI="${PREFIX}/libffi"
TCLTK="${PREFIX}/tcl-tk"
PGSQL="${PREFIX}/postgresql@10"
LIBS=('ZLIB' 'BZIP2' 'READLINE' 'SQLITE' 'OPENSSL' 'PGSQL' 'TCLTK' 'FFI')

# ASDF
# if [ -d "$HOME/.asdf" ]; then
# #   zinit ice wait lucid
# #   zinit light asdf-vm/asdf
# # OR
#   load_asdf() {
#     . $HOME/.asdf/asdf.sh
#     export GOPATH=$(go env GOPATH)
#     export PATH="$GOPATH/bin:$PATH"
#   }

#   zinit light-mode wait'0' lucid for \
#     atload'load_asdf' \
#       zdharma/null
# fi

export ENABLE_FLUTTER_DESKTOP=true

export QT_DIR="$BREW_PREFIX/Cellar/qt@5/5.15.2"
export QT_VERSION=5.15.2
export QT_API=5.13.0

export PATH="$HOME/.local/bin:$BREW_PREFIX/sbin:$BREW_PREFIX/libexec/gnubin:$BREW_PREFIX/share/luarocks/bin:$PATH"

#####################
# FZF SETTINGS      #
#####################
FD_OPTIONS="--hidden --follow"
export FZF_DEFAULT_OPTS="
--ansi
--info inline
--height 50%
--prompt 'λ -> '
--pointer '|>'
--marker '✓'
--border
--layout reverse
--bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
--bind 'ctrl-v:execute(code {+})'"
# export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS || git ls-files --cached --others --exclude-standard"
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
# export FZF_COMPLETION_OPTS="-x"

#####################
# FZF SETTINGS      #
#####################
# --layout=default
# export FZF_DEFAULT_OPTS="
# --ansi
# --layout reverse
# --info inline
# --height 50%
# --multi
# --cycle
# --preview-window right:50%,sharp,cycle
# --prompt 'λ -> '
# --pointer '|>'
# --marker '✓'
# --bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)' > selected
# --bind 'ctrl-v:execute(code {+})'"
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_DEFAULT_COMMAND='fzf'
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# --preview 'bat --style=numbers --color=always --line-range :500 {}'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


#####################
# GO SETTINGS       #
#####################
export CGO_ENABLED=1
export CGO_CFLAGS="-g -O2"

# --preview '([[ -f {} ]] && (bat --style=numbers --color=always --theme=gruvbox-dark --line-range :500 {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
for LIB in $LIBS; do

  BINDIR="${(P)LIB}/bin"
  if [ -d "${BINDIR}" ]; then
    export PATH="${BINDIR}:$PATH"
  fi

  LIBDIR="${(P)LIB}/lib"
  if [ -d "${LIBDIR}" ]; then
    export LDFLAGS="-L${LIBDIR} $LDFAGS"
    # export DYLD_LIBRARY_PATH="${LIBDIR}:$DYLD_LIBRARY_PATH"
    PKGCFGDIR="${LIBDIR}/pkgconfig"
    if [ -d "${PKGCFGDIR}" ]; then
      export PKG_CONFIG_PATH="${PKGCFGDIR} $PKG_CONFIG_PATH"
    fi
  fi

  INCDIR="${(P)LIB}/include"
  if [ -d "${INCDIR}" ]; then
    export CFLAGS="-I${INCDIR} $CFLAGS"
  fi

done

export LDFLAGS="${LDFLAGS} -L$BREW_PREFIX/lib"
export CPPFLAGS="${CFLAGS}"
export CPPFLAGS="${CPPFLAGS} -I$BREW_PREFIX/include"
export CXXFLAGS="${CPPFLAGS}"
