# Antidote Integration
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# Pywal Integration
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# Autosuggest Customization
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Shortcut Aliases
alias c='clear'
alias lsf='ls -la --color=auto'
alias lss='lsix'
alias ff='fastfetch'
alias ..='cd ..'
alias ...='cd ../..'

alias upd='yay -Syu'
alias updss='SKIP_SNAP=1 yay -Syu'

# QoL Upgrades
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
bindkey -v

# Case-Insensitive Completetion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# History Improvements
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ZSH Native Git Status
setopt PROMPT_SUBST
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{3}(%b)%f '

# The Final Prompt Layout
PROMPT='${vcs_info_msg_0_}%F{5}[%f%F{4}%m%f %F{10}%1~%f%F{5}]:%f '
