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
if $(which exa >/dev/null); then
  alias ls="exa"
  alias ll='exa -lg --icons --group-directories-first'
  alias l='exa -lga --icons --group-directories-first'
else
  alias ll="ls -l"
  alias l="ls -la"
fi

if $(which bat >/dev/null); then
  alias cat="bat --paging=never --style=changes"
fi
if $(which batcat >/dev/null); then
  alias cat="bat --paging=never --style=changes"
fi

alias kgp="kubectl get pods"
alias kge="kubectl get events --sort-by=.metadata.creationTimestamp"

if $(which nvim >/dev/null); then
  alias vim="nvim"
fi

alias vpn='sudo -b /opt/homebrew/bin/openfortivpn -c /usr/local/etc/openfortivpn/config -o '

if $(which kitty >/dev/null); then
  alias ssh="kitty +kitten ssh"
fi

# Modules
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
if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


## Load Angular CLI autocompletion.
if $(which ng >/dev/null); then
  source <(ng completion script)
fi



# Needs to be at the end
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
