# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/justin/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

antigen bundle git   
antigen bundle heroku
antigen bundle pip   
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme ys
