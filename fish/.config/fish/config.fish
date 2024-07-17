if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

### ALIASES ###
alias vi='nvim'
alias cfnv='nvim ~/.config/nvim'
alias cff='nvim ~/.config/fish/config.fish'
alias ls='eza --icons=always -a --color=always --group-directories-first'

### FUNCTIONS ###

# Show $PATH in clean list
function showpath
  for val in $PATH
    echo "entry: $val"
  end
end

function vs
  if test -e ./Session.vim
    nvim -S Session.vim
    else
        echo No session file found
  end
end
