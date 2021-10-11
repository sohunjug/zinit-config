export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890
export no_proxy=pypi.vvmm.ink,harbor.kkws.cn,file.vvmm.ink
export RSYNC_PROXY="127.0.0.1:7890"


hproxy() {
  export http_proxy=http://127.0.0.1:7890
  export https_proxy=http://127.0.0.1:7890
  unset all_proxy
}

lproxy() {
  export http_proxy=http://127.0.0.1:7890
  export https_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
}

sproxy() {
  export http_proxy=http://10.188.88.88:7890
  export https_proxy=http://10.188.88.88:7890
  export all_proxy=socks5://10.188.88.88:7890
}

kproxy() {
  export https_proxy=http://proxy.kkws.cn:7890
  export http_proxy=http://proxy.kkws.cn:7890
  export all_proxy=socks5://proxy.kkws.cn:7890
}

noproxy() {
  unset http_proxy
  unset https_proxy
  unset all_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset ALL_PROXY
}
