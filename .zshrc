# alias
alias ll='ls -la'
alias gph='git push origin HEAD'
alias de='cd ~/Desktop'
alias cht='cht.sh '
alias chsh='cht.sh --shell '
alias python='python3'
alias dockerallrm='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'
alias allcache='sudo rm -rf /System/Library/Caches/* /Library/Caches/* ~/Library/Caches/*'

# function
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

# plugin
zinit ice wait lucid
zinit load zdharma/fast-syntax-highlighting  # syntax highlight
zinit ice wait lucid
zinit load zsh-users/zsh-autosuggestions  # suggest
zinit ice wait lucid
zinit load djui/alias-tips  # alias
