#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias refresh='random_quote ~/.config/quotes.txt && printf "\n"'

alias ls='ls -A --color=auto --group-directories-first'
alias lsa='ls -1shA --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ff='fastfetch -l none'
alias clear='clear && refresh'
alias cls='clear && ls && printf "\n"'
cds() {
  cd "$@" && ls .
}

ai_model="opencode/big-pickle"
ai_issue_solver() {
	prompt=$(cat ~/.prompts/repo_issues.md)
	opencode --prompt "$prompt" -m $ai_model
}
ai_documentation() {
	prompt=$(cat ~/.prompts/documentation.md)
	opencode --prompt "$prompt" -m $ai_model
}
ai_readme() {
	prompt=$(cat ~/.prompts/generate_readme.md)
	opencode --prompt "$prompt" -m $ai_model
}
ai_rewrite() {
	prompt=$(cat ~/.prompts/rewrite.md)
	opencode --prompt "$prompt" -m $ai_model
}
ai_explanation() {
	prompt=$(cat ~/.prompts/explanation.md)
	opencode --prompt "$prompt" -m $ai_model
}
ai_improve() {
	prompt=$(cat ~/.prompts/improve.md)
	opencode --prompt "$prompt" -m $ai_model
}

connect_windows() {
	folder=$@
	mkdir -p /home/max/win/$folder
	sudo mount -t cifs //192.168.2.7/$folder /home/max/win/$folder -o username=max,uid=1000,gid=1000,file_mode=0777,dir_mode=0777
}

alias gd='git diff | nvim'

PS1='\[\e[38;5;45m\]\u\[\e[0m\] \[\e[38;5;202m\]\w\[\e[0m\] => '

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export PATH="$HOME/.cargo/bin:$PATH"
refresh
