# エイリアス
alias ll='ls -la'
alias de='cd ~/Desktop'
alias dockerallrm='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'
alias allcache='sudo rm -rf /System/Library/Caches/* /Library/Caches/* ~/Library/Caches/*'

# ディレクトリ移動
setopt auto_cd

# gitステータス表示
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on branch %b'
setopt PROMPT_SUBST
PROMPT='%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} > '

# 独自関数
gradd(){
  git remote add origin $1
}
glconfig(){
  git config --local user.name "$1"
  git config --local user.email "$2"
}
gcm(){
  git commit -m "$1"
}
gad(){
  git add -u $1
}