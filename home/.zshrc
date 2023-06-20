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
#alias l="gls -Flha --group-directories-first"
#alias ll="gls -Flh --group-directories-first"

#alias l='colorls --sort-dirs -1'
alias ls="exa"
alias ll='exa -lg --icons --group-directories-first'
alias l='exa -lga --icons --group-directories-first'

alias cat="bat --paging=never --style=changes"

alias kgp="kubectl get pods"
alias vim="nvim"
alias vpn='sudo -b /opt/homebrew/bin/openfortivpn -c /usr/local/etc/openfortivpn/config -o '


# Modules
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

# Autocomplete
autoload -U +X bashcompinit && bashcompinit
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit

  compinit
fi

## Load Angular CLI autocompletion.
source <(ng completion script)

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# Needs to be at the end
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
