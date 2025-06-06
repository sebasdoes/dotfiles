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
HISTSIZE=12000
SAVEHIST=10000
HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY 
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


alias root="sudo -u root --preserve-env='SSH_CONNECTION' zsh"
alias kgp="kubectl get pods"


# Modules
if $(which eza &>/dev/null); then
  alias ls="eza"
  alias ll='eza -lg --icons --group-directories-first'
  alias l='eza -lga --icons --group-directories-first'
elif $(which exa &>/dev/null); then
  alias ls="exa"
  alias ll='exa -lg --icons --group-directories-first'
  alias l='exa -lga --icons --group-directories-first'
else
  alias ll='ls -l'
  alias l='ls -la'
fi

if $(which bw &>/dev/null); then
  alias bw_sshkeys="NODE_EXTRA_CA_CERTS=\"${HOME}/.local/lan_comp.crt\" bw_add_ssh_keys"
fi

if $(which bat &>/dev/null); then
  alias bat="bat --paging=never --style=auto"
  alias cat="bat --paging=never -p"
fi

#if $(which nvim >/dev/null); then
#  alias vim="nvim"
#fi

if $(which kitty &>/dev/null); then
  alias ssho="$(which ssh)"
  alias ssh="kitty +kitten ssh"
  alias e="edit-in-kitty --type tab" 
fi

if $(which brew &>/dev/null); then
  eval "$($(which brew) shellenv)"
  if $(which openfortivpn &>/dev/null); then
    alias vpn='sudo -b /opt/homebrew/bin/openfortivpn -c /usr/local/etc/openfortivpn/config -o '
  fi
fi

if $(which starship &>/dev/null); then
  eval "$(starship init zsh)"
fi

# Run SSH-agent for arch with systemd version of ssh agent
if [ -S "${HOME}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock" ]; then
  export SSH_AUTH_SOCK="${HOME}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock"
elif [ -S "/run/user/$(id -u)/ssh-agent.socket" ]; then
  export SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent.socket"
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
if $(which ng &>/dev/null); then
  source <(ng completion script)
fi

# Needs to be at the end
if [ ! -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  ~/.local/bin/git_clone_if_needed -o 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting &>/dev/null
fi
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
