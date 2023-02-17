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

# Git utilities

# Add, commit, push
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# Aliases
alias cfz="vim ~/.zshrc"
alias cfv="vim ~/.vimrc"
alias ls="exa --icons"
alias rm="rm -I"

# FZF plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load syntax highlighting plug-in (should be last)
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

