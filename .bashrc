#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l --color=auto'
alias lsa='ls -lA --color=auto'
alias grep='grep --color=auto'

PS1='\[\e[38;5;45m\]\u\[\e[0m\]  \[\e[38;5;202m\]\w\[\e[0m\]: '

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
