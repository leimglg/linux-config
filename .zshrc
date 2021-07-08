uexport SHELL=$(which zsh)
export EDITOR="nvim"
export VISUAL="nvim"
eval `dircolors`

bindkey -s "^f" ' $(find -L | fzf --multi --preview "cat {}")^M'
bindkey -s '^g' 'cd $(find -type d | fzf --multi)^M'
bindkey -s '^t' "history | fzf --multi^M"

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({0..9}) alias "$index"="cd +${index}"; unset index

setopt PROMPT_SUBST
autoload -U colors && colors
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.config/histfile"
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt autocd extendedglob notify
unsetopt beep
echo -ne '\e[6 q'

zmodload zsh/complist
autoload -Uz compinit; compinit
_comp_options+=(globdots) # With hidden files
unsetopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
# setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CONFIG_HOME/zcompcache"
zstyle ':completion:*' menu select
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' complete true
zstyle ':completion:*' complete-options true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
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

#   auto suggestion
if [ ! -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#   syntax highlighting,  must be sourced at the end of the .zshrc file
if [ ! -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold' 
