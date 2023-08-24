# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

setopt incappendhistory
#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# ------------------------------
# Post-init module configuration
# ------------------------------

PATH="$HOME/.local/bin:$PATH"

# Aliases
alias ls="exa"
alias ll='exa -lg --icons --group-directories-first'
alias l='exa -lga --icons --group-directories-first'

alias cat="bat --paging=never --style=changes"

alias kgp="kubectl get pods"
alias vpn='sudo -b /opt/homebrew/bin/openfortivpn -c /usr/local/etc/openfortivpn/config -o '


# Modules
if $(which nvim >/dev/null); then
  alias vim="nvim"
fi
if $(which brew >/dev/null); then
  eval "$($(which brew) shellenv)"
fi
if $(which starship >/dev/null); then
  eval "$(starship init zsh)"
fi

# Autocomplete
autoload -U +X bashcompinit && bashcompinit
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit

  compinit
fi

# Autosuggestions
if [ ! -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  ~/.local/bin/git_clone_if_needed -o 1 https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions &>/dev/null
fi
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


## Load Angular CLI autocompletion.
if $(which ng >/dev/null); then
  source <(ng completion script)
fi



# Needs to be at the end
if [ ! -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  ~/.local/bin/git_clone_if_needed -o 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting &>/dev/null
fi
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
