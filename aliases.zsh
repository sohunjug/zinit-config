
# alias jdk15="export JAVA_HOME=${JAVA_15_HOME}; export PATH=${JAVA_15_HOME}/bin:${OPATH};"
# alias jdk8="export JAVA_HOME=${JAVA_8_HOME}; export PATH=${JAVA_8_HOME}/bin:${OPATH};"
alias ka='kubectl apply -f'
alias kd='kubectl delete -f'
alias ll="chpwd -lhaBgb"
alias ls="chpwd"
alias la="chpwd -a"

alias ec="/opt/homebrew/bin/emacsclient"

alias tar="tar --exclude '.DS_Store' --exclude '__MACOSX'"
alias pyssh="${HOME}/.sshlist/ssh.py"
alias vi=nvim
alias vibrew="nvim ~/Code/dotfiles/Brewfile"

#####################
# ALIASES           #
#####################
alias vim=$EDITOR
alias ccat="ccat --bg=dark"
alias cat=bat
alias tf=terraform
alias l="exa -abghHlS --git --group-directories-first"
alias myip=ip-internal
alias sysinfo="inxi -Fxxxz"
alias psqlstart="sudo systemctl start postgresql.service"
alias h="http"
