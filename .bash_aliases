alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

if command -v "fastfetch" > /dev/null 2>&1; then
	alias clear='clear && fastfetch'
fi
