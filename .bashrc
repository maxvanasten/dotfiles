#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lA --color=auto'
alias lsa='ls -lA --color=auto'
alias grep='grep --color=auto'

HNCOLOR="$(tput setaf 9)"
TCOLOR="$(tput setaf 11)"
CWDCOLOR="$(tput setaf 14)"
RESET="$(tput sgr0)"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
