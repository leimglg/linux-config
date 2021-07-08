[ -f $HOME/bin/zsh ] && [ "$SSH_TTY" ] && exec $HOME/bin/zsh -l

eval `dircolors`
alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias tmux='tmux -2'
export TERM=xterm-256color
export PATH=$HOME/software:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH




if [[ "$(set -o | grep 'emacs\|\bvi\b' | cut -f2 | tr '\n' ':')" != 'off:off:' ]]; then
    [ "$SSH_TTY" ] && exec $(which zsh) -l

    #             fzf
    bind '"\C-f": " $(find -L | fzf --multi --preview \"cat {}\")\n"'
    bind '"\C-g": "cd $(find -type d | fzf --multi)\n"'
    bind '"\C-t": "history | fzf --multi\n"'
fi
