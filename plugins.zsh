#####################
# PROMPT            #
#####################
# zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
# zinit load starship/starship

zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit ice depth=1; zinit light mafredri/zsh-async

# zsh-startify, a vim-startify like plugin
# zinit ice wait"0b" lucid atload"zsh-startify"
# zinit load zdharma/zsh-startify
# Loading tmux first, to prevent jumps when tmux is loaded after .zshrc
# It will only be loaded on first start
# zinit ice atinit"
#         ZSH_TMUX_FIXTERM=false;
#         ZSH_TMUX_AUTOSTART=false;
#         ZSH_TMUX_AUTOCONNECT=false;"
# zinit snippet OMZP::tmux

zinit wait lucid for \
  OMZL::clipboard.zsh \
  OMZL::compfix.zsh \
  OMZL::completion.zsh \
  OMZL::correction.zsh \
    atload"
        alias ..='cd ..'
        alias ...='cd ../..'
        alias ....='cd ../../..'
        alias .....='cd ../../../..'
    " \
  OMZL::directories.zsh \
  OMZL::diagnostics.zsh \
  OMZL::git.zsh \
  OMZL::grep.zsh \
  OMZL::history.zsh \
  OMZL::key-bindings.zsh \
  OMZL::spectrum.zsh \
  OMZL::termsupport.zsh \
    atload"
        alias gcd='gco dev'
    " \
  OMZP::git/git.plugin.zsh \
  OMZP::brew \
  OMZP::fasd \
  OMZP::extract \
  OMZP::git-extras \
  OMZP::sudo/sudo.plugin.zsh \
  OMZP::fzf \
  OMZP::git-auto-fetch/git-auto-fetch.plugin.zsh \
    atload"
        alias dcb='docker-compose up --build'
    " \
  OMZP::docker-compose \
  as"completion" \
    OMZP::docker/_docker \
    OMZP::thefuck/thefuck.plugin.zsh \
    djui/alias-tips \
    # hlissner/zsh-autopair \
    # chriskempson/base16-shell \

zinit load agkozak/zsh-z

# =========================================================================== #
# Asdf-vm - Extendable (v)ersion (m)anager for languages tools
# ------------------------------------------------------------
# https://github.com/asdf-vm/asdf
# =========================================================================== #
    # export ASDF_PYTHON_DEFAULT_PACKAGES_FILE="$ZDOTDIR/.default-python-packages";
    # export ASDF_NPM_DEFAULT_PACKAGES_FILE="$ZDOTDIR/.default-npm-packages"' \
zinit id-as"asdf" \
  atinit'export ASDF_DATA_DIR="$HOME/.asdf"; \
    export ASDF_CONFIG_FILE="$ASDF_DATA_DIR/.asdfrc"; '\
  src"asdf.sh" \
  atload'install_asdf_plugins; unfunction install_asdf_plugins;
    export GOPATH=$(go env GOPATH)
    export PATH="$GOPATH/bin:$PATH"' \
  for @asdf-vm/asdf
#####################
# PLUGINS           #
#####################
# @source: https://github.com/crivotz/dot_files/blob/master/linux/zplugin/zshrc

# IMPORTANT:
# These plugins should be loaded after ohmyzsh plugins

zinit wait lucid for \
  light-mode atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20" atload"!_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  light-mode atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
      zdharma/fast-syntax-highlighting \
  light-mode blockf atpull'zinit creinstall -q .' \
  atinit"
      zstyle ':completion:*' completer _expand _complete _ignored _approximate
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':completion:*' menu select=2
      zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
      zstyle ':completion:*:descriptions' format '-- %d --'
      zstyle ':completion:*:processes' command 'ps -au$USER'
      zstyle ':completion:complete:*:options' sort false
      zstyle ':fzf-tab:complete:_zlua:*' query-string input
      zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
      zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
      zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'exa -1 --color=always ${~ctxt[hpre]}$in'
  " \
      zsh-users/zsh-completions \
  bindmap"^R -> ^H" atinit"
      zstyle :history-search-multi-word page-size 10
      zstyle :history-search-multi-word highlight-color fg=red,bold
      zstyle :plugin:history-search-multi-word reset-prompt-protect 1
  " \
      zdharma/history-search-multi-word \
  reset \
  atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
          \${P}sed -i \
          '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
          \${P}dircolors -b LS_COLORS > c.zsh" \
  atpull'%atclone' pick"c.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
    trapd00r/LS_COLORS

