export SHELL=$(which zsh)
export EDITOR="nvim"
export VISUAL="nvim"
eval `dircolors`

bindkey -s "^ff" ' $(find -type f | fzf --multi --preview "cat {}")^M'
bindkey -s "^fr" ' $(fzf --bind "change:reload:rg --column --line-number --no-heading --color=always --smart-case {q} || true" --ansi)^M'
bindkey -s '^fd' 'cd $(find -type d | fzf --multi)^M'
bindkey -s '^fh' '$(history | fzf --multi)^M'

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({0..9}) alias "$index"="cd +${index}"; unset index

setopt interactive_comments
stty stop undef     # Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
setopt PROMPT_SUBST
autoload -U colors && colors
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.config/zsh/histfile"
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt autocd extendedglob notify
unsetopt beep
echo -ne '\e[6 q'

zmodload zsh/complist
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
unsetopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.config/zsh/zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' complete true
zstyle ':completion:*' complete-options true
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' keep-prefix true
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

PS1="%B%F{cyan}%~ %F{green}>%f%b "
RPROMPT='%B%F{yellow}$([ -d .git ] || [ -d ../.git ] && git branch 2>/dev/null | grep "^*" | sed s/..//)%b%f %n@%M %T'

zstyle :compinstall filename '/home/mlei/.zshrc'

source ~/.config/aliases.zshrc
source ~/.config/exports.zshrc




# function plugin manager
function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ ! -f "$HOME/.config/zsh/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" ]; then
        git clone "https://github.com/$1.git" "$HOME/.config/zsh/plugins/$PLUGIN_NAME"
    fi
    source $HOME/.config/zsh/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh
}

#   auto suggestion
zsh_add_plugin "zsh-users/zsh-autosuggestions"
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#   syntax highlighting,  must be sourced at the end of the .zshrc file
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
