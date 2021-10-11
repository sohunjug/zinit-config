[[ ! -f $S_ZSH/proxy.zsh ]] || source $S_ZSH/proxy.zsh
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

setopt promptsubst

#####################
# HISTORY           #
#####################
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

#####################
# SETOPT            #
#####################
# set -o emacs
# setopt vi
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data
setopt always_to_end          # cursor moved to the end in full completion
setopt hash_list_all          # hash everything before completion
setopt completealiases        # complete alisases
setopt always_to_end          # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word       # allow completion from within a word/phrase
setopt nocorrect              # spelling correction for commands
setopt list_ambiguous         # complete as much of a completion until it gets ambiguous.
setopt nolisttypes
setopt listpacked
setopt automenu
# open_with_fzf() {
#     fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
# }

# cd_with_fzf() {
#     cd $HOME && cd "$(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden)"
# }
# zle -N cd_with_fzf{,}

# pacs() {
#     sudo pacman -Syy $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
# }
# zle -N pacs{,}


# bindkey '^N' cd_with_fzf

# zinit is-snippet for \
#     if"[[ -f $S_ZSH/envs.zsh  ]]" $S_ZSH/envs.zsh \
#     if"[[ -f $S_ZSH/functions.zsh  ]]" $S_ZSH/functions.zsh \
#     if"[[ -f $S_ZSH/plugins.zsh  ]]" $S_ZSH/plugins.zsh \
#     if"[[ -f $S_ZSH/aliases.zsh  ]]" $S_ZSH/aliases.zsh \
#     if"[[ -f $S_ZSH/lazy.zsh  ]]" $S_ZSH/lazy.zsh \
#     if"[[ -f $S_ZSH/p10k.zsh  ]]" $S_ZSH/p10k.zsh \
#     if"[[ -f $HOME/.fzf.zsh  ]]" $HOME/.fzf.zsh
#
[[ ! -f $S_ZSH/envs.zsh      ]] || source $S_ZSH/envs.zsh
[[ ! -f $S_ZSH/functions.zsh ]] || source $S_ZSH/functions.zsh
[[ ! -f $S_ZSH/plugins.zsh   ]] || source $S_ZSH/plugins.zsh
[[ ! -f $S_ZSH/aliases.zsh   ]] || source $S_ZSH/aliases.zsh
[[ ! -f $S_ZSH/lazy.zsh      ]] || source $S_ZSH/lazy.zsh
[[ ! -f $S_ZSH/p10k.zsh      ]] || source $S_ZSH/p10k.zsh
[[ ! -f $HOME/.fzf.zsh       ]] || source $HOME/.fzf.zsh
