#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias refresh='random_quote ~/.config/quotes.txt && printf "\n"'

alias ls='ls -A --color=auto'
alias lsa='ls -1shA --color=auto'
alias grep='grep --color=auto'
alias ff='fastfetch -l none'
alias clear='clear && refresh'
alias cls='clear && ls && printf "\n"'

PS1='\[\e[38;5;45m\]\u\[\e[0m\] \[\e[38;5;202m\]\w\[\e[0m\] => '

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

refresh
