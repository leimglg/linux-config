alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias tmux='tmux -2'

# fzf
bind '"\C-f": " $(find -L | fzf --multi --preview \"cat {}\")\n"'
bind '"\C-g": "cd $(find -type d | fzf --multi)\n"'
bind '"\C-t": "history | fzf --multi\n"'
