# Antidote Integration
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# Pywal Integration
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

# Shortcut Aliases
alias c='clear'
alias lsf='ls -la --color=auto'
alias lss='lsix'
alias ff='fastfetch'
alias ..='cd ..'
alias ...='cd ../..'
alias ss='grim -g "$(slurp)" - | wl-copy'

# QoL upgrades
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
bindkey -v

# Case-insensitive completion and menu selection
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# History Improvements
setopt APPEND_HISTORY          # Add to history, don't overwrite
setopt SHARE_HISTORY           # Share history between all open terminals
setopt HIST_IGNORE_DUPS        # Don't record the same command twice in a row
setopt HIST_IGNORE_SPACE       # Don't record commands starting with a space

# ZSH Native Git Status
setopt PROMPT_SUBST
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{3}(%b)%f '

# The Final Prompt Layout
PROMPT='${vcs_info_msg_0_}%F{5}[%f%F{4}%m%f %F{10}%1~%f%F{5}]:%f '
