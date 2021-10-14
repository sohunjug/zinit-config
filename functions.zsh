#####################
# Functions         #
#####################

_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
# echo "Ethernet :: IP => $( ip -4 -o a show wlan1 | awk '{ print $4 }' )"
ip-internal() echo "Wireless :: IP => $( ip -4 -o a show wlo1 | awk '{ print $4 }' )"
ip-external() echo "External :: IP => $( curl --silent https://ifconfig.me )"
ipinfo() { ipInternal && ipExternal }

# prcreate() gh pr create -B "$1" -f
# prmerge() gh pr merge --merge --delete-branch=false "$1"
# prcheck() { gh pr checkout "$1" && gh pr diff }
# prlist() gh pr list --state open


kkwsvm() {
  sudo /sbin/route add 172.21.0.0/16 -interface utun9
  sudo /sbin/route add 172.22.0.0/16 -interface utun9
  sudo /sbin/route add 172.23.0.0/16 -interface utun9
  sudo /sbin/route add 172.24.0.0/16 -interface utun9
}

kkws1() {
  sudo ip route add 10.1.0.0/16 gw 10.188.2.1
  sudo ip route add 10.3.0.0/16 gw 10.188.2.3
}

kkws2() {
  sudo ip route add 10.1.0.0/16 gw 10.118.2.1
  sudo ip route add 10.3.0.0/16 gw 10.118.2.3
}

kkwssz() {
  sudo ip route add 10.1.0.0/16 gw 10.118.11.1
  sudo ip route add 10.3.0.0/16 gw 10.118.2.3
}

diskkws() {
  sudo route delete 10.1/16
  sudo route delete 10.3/16
}

diskkwsvm() {
  sudo route delete 172.21/16
  sudo route delete 172.22/16
  sudo route delete 172.23/16
  sudo route delete 172.24/16
}

chpwd() exa --git --icons --classify --group-directories-first --time-style=long-iso --group --color-scale $@

function install_asdf_plugins() {
  local plugins_list_to_install=( \
    # https://github.com/asdf-vm/asdf-nodejs
    nodejs \
    # https://github.com/danhper/asdf-python
    python \
    # https://github.com/code-lever/asdf-rust
    rust \
    # https://github.com/kennyp/asdf-golang
    golang \
                # https://github.com/asdf-community/asdf-poetry
    poetry \
  )
  local installed_plugins=$(asdf plugin list)
  for plugin in $plugins_list_to_install; do
    if [[ "$installed_plugins" != *"$plugin"* ]]; then
      command asdf plugin add $plugin
      print -P "%F{blue}Added plugin for %K{white} $plugin %k anod now installing the latest version...%f"
      if [[ "$plugin" == "nodejs" ]]; then
        bash -c "$ASDF_DATA_DIR/plugins/nodejs/bin/import-release-team-keyring"
      fi
                        command asdf install $plugin
      command asdf reshim $plugin
      print -P "%F{green}Finished installing the lastest version with asdf %K{white} $plugin %k%f."
    else
      if [[ "$plugin" == "rust" ]]; then
        zinit \
          id-as"cargo-completion" \
          mv"cargo* -> _cargo" \
          as"completion" \
          for https://github.com/rust-lang/cargo/blob/master/src/etc/_cargo
      fi
    fi
  done
}

reload() {
  source ~/.zshrc
}
