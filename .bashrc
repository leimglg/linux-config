[ -f $HOME/bin/zsh ] && [ "$SSH_TTY" ] && exec $HOME/bin/zsh -l

eval `dircolors`
alias nv='nvim'
alias vim='nvim'
alias vi='nvim'
alias tmux='tmux -2'
export TERM=xterm-256color
export PATH=$HOME/software:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH



# make interactive stuff only works if line editing is on
if [[ "$(set -o | grep 'emacs\|\bvi\b' | cut -f2 | tr '\n' ':')" != 'off:off:' ]]; then
    # only works when ssh remotely
    [ "$SSH_TTY" ] && exec $(which zsh) -l

    #             fzf
    bind '"\C-ff": " $(find -type f | fzf --multi --preview \"cat {}\")\n"'
    bind '"\C-fr": " $(fzf --bind \"change:reload:rg --column --line-number --no-heading --color=always --smart-case {q} || true\" --ansi --disabled)\n"'
    bind '"\C-fd": "cd $(find -type d | fzf --multi)\n"'
    bind '"\C-fh": "$(history | fzf --multi)\n"'
fi
