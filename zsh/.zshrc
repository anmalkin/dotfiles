# Change prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Aliases
alias cfz="nvim ~/.zshrc"
alias cfv="nvim ~/.vimrc"
alias cfnv="nvim ~/.config/nvim/init.lua"
alias rm="rm -I"
alias vi="nvim"
alias gdb="lldb"

[ -f "/Users/amalkin/.ghcup/env" ] && source "/Users/amalkin/.ghcup/env" # ghcup-env
