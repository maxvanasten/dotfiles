#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias refresh='printf "\n" && bible -r && printf "\n"'

alias ls='ls -l --color=auto'
alias lsa='ls -lA --color=auto'
alias grep='grep --color=auto'
alias clear='clear && refresh'

PS1='\[\e[38;5;45m\]\u\[\e[0m\] | \[\e[38;5;202m\]\w\[\e[0m\]: '

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

refresh
