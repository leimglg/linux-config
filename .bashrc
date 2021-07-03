alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias tmux='tmux -2'
export TERM=xterm-256color
export PATH=$HOME/software:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# fzf
bind '"\C-f": " $(find -L | fzf --multi --preview \"cat {}\")\n"'
bind '"\C-g": "cd $(find -type d | fzf --multi)\n"'
bind '"\C-t": "history | fzf --multi\n"'
