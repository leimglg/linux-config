alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias tmux='tmux -2'

# fzf
export FZF_DEFAULT_COMMAND='find -L'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"


bind '"\C-f": " $(fzf)\n"'
bind '"\C-g": "cd $(find -type d | fzf --multi)\n"'
bind '"\C-t": "history | fzf --multi\n"'
