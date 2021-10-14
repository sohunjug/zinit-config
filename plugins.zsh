#####################
# PROMPT            #
#####################
# zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
# zinit load starship/starship

zinit ice depth=1; zinit light romkatv/powerlevel10k

# zinit ice depth=1; zinit light mafredri/zsh-async
zinit ice depth=1; zinit light black7375/zsh-lazyenv

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
    atload"unalias grv g" \
  OMZP::git \
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
    spwhitt/nix-zsh-completions 
    # hlissner/zsh-autopair \
    # chriskempson/base16-shell \

zinit wait lucid for  \
  agkozak/zsh-z \
  bobsoppe/zsh-ssh-agent

zinit light-mode compile"handler" for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node \
    zinit-zsh/z-a-submods \
    zinit-zsh/z-a-rust

zinit wait"2" lucid trigger-load'!gi;!gii' \
 dl'https://gist.githubusercontent.com/psprint/1f4d0a3cb89d68d3256615f247e2aac9/raw -> templates/Zsh.gitignore' \
 for \
    voronkovich/gitignore.plugin.zsh
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
      # zstyle ':completion:*' completer _expand _complete _ignored _approximate

zinit wait lucid for \
  light-mode atinit'ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20;' atload"!_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  light-mode atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
      zdharma/fast-syntax-highlighting \
  light-mode blockf atpull'zinit creinstall -q .' \
  atinit"
      zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
      zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'
      zstyle ':completion:*:correct:*'                    insert-unambiguous true
      zstyle ':completion:*:corrections'                  format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
      zstyle ':completion:*:correct:*'                    original true
      zstyle ':completion:*:expand:*'                     tag-order all-expansions
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':completion:*:matches'                      group 'yes'
      zstyle ':completion:*'                              group-name ''
      zstyle ':completion:*:messages'                     format '%d'
      zstyle ':completion:*:options'                      auto-description '%d'
      zstyle ':completion:*:options'                      description 'yes'
      zstyle ':completion:*:*:-subscript-:*'              tag-order indexes parameters
      zstyle ':completion:*' menu select=2
      zstyle ':completion:*:warnings'                     format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'
      zstyle ':completion:*:*:zcompile:*'                 ignored-patterns '(*~|*.zwc)'
      zstyle ':completion:correct:'                       prompt 'correct to: %e'
      zstyle ':completion::(^approximate*):*:functions'   ignored-patterns '_*'
      zstyle ':completion::complete:*'                    gain-privileges 1
      zstyle ':completion:*:manuals'                      separate-sections true
      zstyle ':completion:*:manuals.*'                    insert-sections   true
      zstyle ':completion:*:man:*'                        menu yes select
      zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
      zstyle ':completion:*:descriptions' format '-- %d --'
      zstyle ':completion:*:processes' command 'ps -au$USER'
      zstyle ':completion:complete:*:options' sort false
      zstyle ':completion:*:(ssh|scp|rsync):*'            tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
      zstyle ':completion:*:(scp|rsync):*'                group-order users files all-files hosts-domain hosts-host hosts-ipaddr
      zstyle ':completion:*:ssh:*'                        group-order users hosts-domain hosts-host users hosts-ipaddr
      zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
      zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
      zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255'
      zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm,cmd -w -w'
  " \
      zsh-users/zsh-completions \
  atinit"
      zstyle ':fzf-tab:complete:_zlua:*' query-string input
      zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == \"[process ID]\" ]] && ps --pid=$word -o cmd --no-headers -w -w'
      zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' fzf-preview 'echo ${(P)word}'
      zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'|
      zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
      zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'

      zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
        'case \"$group\" in
        \"commit tag\") git show --color=always $word ;;
                     *) git show --color=always $word | delta ;;
        esac'
      zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
        'case \"$group\" in
                      \"modified file\") git diff $word | delta ;;
          \"recent commit object name\") git show --color=always $word | delta ;;
                                      *) git log --color=always $word ;;
        esac'
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
      zstyle ':fzf-tab:complete:(\\|)run-help:*' fzf-preview 'run-help $word'
      zstyle ':fzf-tab:complete:(\\|*/|)man:*' fzf-preview 'man $word'
      zstyle ':fzf-tab:*' switch-group ',' '.'
      zstyle ':completion:*:git-checkout:*' sort false
      zstyle ':completion:*:descriptions' format '[%d]'
  " \
  atload"enable-fzf-tab" \
      Aloxaf/fzf-tab \
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
  atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"' \
    trapd00r/LS_COLORS
      # zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0

zinit ice wait"1" lucid
zinit light wfxr/forgit

zinit ice from"gh-r" as"command"
zinit light junegunn/fzf
# FZF BYNARY AND TMUX HELPER SCRIPT
zinit ice lucid wait'0c' as"command" id-as"junegunn/fzf-tmux" pick"bin/fzf-tmux"
zinit light junegunn/fzf
# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf

zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid atload'
    alias rg=batgrep.sh
    alias bd=batdiff.sh
    alias man=batman.sh
'
zinit light eth-p/bat-extras
# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep

    # mv"exa* -> exa" sbin  ogham/exa \
zinit wait"2" lucid as"null" from"gh-r" for \
    mv"fd* -> fd" sbin"fd/fd"  @sharkdp/fd
# TREE-SITTER
zinit ice as"program" from"gh-r" mv"tree* -> tree-sitter" pick"tree-sitter"
zinit light tree-sitter/tree-sitter
# PRETTYPING
zinit ice lucid wait'' as"program" pick"prettyping" atload'alias ping=prettyping'
zinit load "denilsonsa/prettyping"

zinit as"null" wait"3" lucid for \
    sbin Fakerr/git-recall \
    sbin paulirish/git-open \
    sbin paulirish/git-recent \
    sbin davidosomething/git-my \
    sbin atload"export _MENU_THEME=legacy" \
        arzzen/git-quick-stats \
    sbin iwata/git-now \
    make"PREFIX=$ZPFX"         tj/git-extras \
    sbin"bin/git-dsf;bin/diff-so-fancy" zdharma/zsh-diff-so-fancy \
    sbin"git-url;git-guclone" make"GITURL_NO_CGITURL=1" zdharma/git-url

# zinit light b0o/zfzf
zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

zinit ice wait'0' lucid
# zinit load zdharma/zsh-startify
zinit load zpm-zsh/ssh
