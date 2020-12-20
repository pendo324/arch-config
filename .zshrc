# Created by newuser for 5.8

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
unsetopt BG_NICE

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

### Functions to make zplugin configuration less verbose
zpt() { zplugin ice wait"${1}" lucid               "${@:2}"; } # Turbo
zpi() { zplugin ice lucid                            "${@}"; } # Regular Ice
zp()  { [ -z $2 ] && zplugin light "${@}" || zplugin "${@}"; } # zplugin

### Oh-my-zsh libs
zpi atinit'ZSH_CACHE_DIR="$HOME/.zcompcache"'
zp snippet OMZ::lib/history.zsh

zp snippet OMZ::lib/completion.zsh

zp snippet OMZ::lib/git.zsh
zp snippet OMZ::plugins/git/git.plugin.zsh
setopt promptsubst

# theme
zp snippet OMZ::lib/theme-and-appearance.zsh
zp snippet OMZ::themes/ys.zsh-theme

zpi snippet OMZ::plugins/docker.zsh
zpt 0c
zp snippet OMZ::plugins/cp/cp.plugin.zsh

zpt 0c
zp snippet OMZ::plugins/postgres/postgres.plugin.zsh
#zpi snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
#zpi snippet OMZ::plugins/systemd/systemd.plugin.zsh

zpt 0c
zp snippet OMZ::plugins/sudo/sudo.plugin.zsh

zpt 2 atload'zpcdreplay'
zp snippet OMZ::plugins/pip/pip.plugin.zsh

# zpt 0c
zpi snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh

zpt 2 atload'zpcdreplay'
zplugin snippet OMZ::plugins/aws/aws.plugin.zsh

zpt 2 atload'zpcdreplay'
zplugin snippet https://raw.githubusercontent.com/drgr33n/oh-my-zsh_aws2-plugin/master/aws2/aws2.plugin.zsh

# zpi atload"zpcdreplay" snippet OMZ::plugins/aws/aws.plugin.zsh

eval "`fnm env --multi`"

zpt 1
zp snippet OMZ::plugins/node/node.plugin.zsh

zpt 2 atload'zpcdreplay'
zp snippet OMZ::plugins/npm/npm.plugin.zsh

# zpt 0b '{src/*.zsh,src/strategies/*}' atload'_zsh_autosuggest_start'
# zp zsh-users/zsh-autosuggestions

#zplugin ice wait lucid
#zplugin light zsh-users/zsh-autosuggestions

#zplugin ice wait jm,lucid
#zplugin light zsh-users/zsh-syntax-highlighting
#zpt 1
#zp zsh-users/zsh-history-substring-search

zplugin ice wait"1" lucid
zplugin light zsh-users/zsh-history-substring-search

# zpt 1 atload'zpcompinit'
# zp zdharma/fast-syntax-highlighting

zpt 1 atload'zpcompinit'
zplugin light zsh-users/zsh-syntax-highlighting

zpt 1 atload'zpcompinit'
zplugin light ~/.zsh/

zpt 0a
zp snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zpi as"completion"
zp snippet OMZ::plugins/docker/_docker

# command + backspace delete line
bindkey "^H" backward-kill-line
bindkey "^[[3;5~" kill-word

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

bindkey "^[[1;3D" beginning-of-line
bindkey "^[[1;3C" end-of-line

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

bindkey "^X^_" redo

# wsl
# export PATH="$PATH:/mnt/c/Program Files/Oracle/VirtualBox"
# export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

setopt histverify
setopt sharehistory
setopt incappendhistory
setopt pushdignoredups
setopt extendedhistory
setopt histexpiredupsfirst
setopt longlistjobs
setopt autocd
setopt autopushd
setopt completeinword
setopt histignorespace
setopt histignoredups
unsetopt flowcontrol
setopt pushdminus
setopt bgnice

# zp snippet "$HOME/Library/Python/3.7/bin/aws_zsh_completer.sh"

alias sed=gsed -E
alias awk=gawk
export PATH=$PATH:/usr/local/bin
