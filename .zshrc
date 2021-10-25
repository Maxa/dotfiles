# .zshrc
# zsh settings for interactive shells

[ -z "$PS1" ] && return
export PS1="$(print '%{\e[0;32m%}%n %{\e[0;34m%}%~ ')\$ $(print '%{\e[0m%}')"
export PS2="> "
export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '

eval $(dircolors -b | sed -e 's/mh=00/mh=44;37/')

export EDITOR="vim"
export VISUAL="rview"
export LESS="iJM"
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /tmp/zshcache
zstyle ':completion:*' ignore-parents pwd
autoload -Uz compinit
compinit

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

bindkey -e
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[5~' beginning-of-history
bindkey '^[[6~' end-of-history

setopt AUTO_CD
setopt HIST_IGNORE_DUPS
setopt PRINT_EXIT_VALUE
setopt NO_HASH_CMDS
setopt NO_HASH_DIRS
setopt NO_FLOW_CONTROL

# aliases

alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias lh='ls -lh'
alias lR='ls -lR'
alias lrt='ls -lrt'
alias lrS='ls -lrS'
alias lart='ls -lart'
alias larS='ls -larS'

alias cp='cp -i --preserve=timestamps'
alias mv='mv -i'
alias rm='rm -I'
alias ..='cd ..'
alias cal='cal -m'
alias v='vim'
alias vd='vimdiff'
alias c='cat'
alias grep='grep --colour=auto'
alias dir='ncdu'

alias -g C='| wc -l'
alias -g G='| grep'
alias -g L='| less'
alias -g N='| sort -n'

alias consolesize='printf "Columns: $COLUMNS, Lines: $LINES\n"'
alias top10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# more aliases

source $HOME/.zshrc.aliases
