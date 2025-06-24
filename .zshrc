HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch nobeep nocaseglob autopushd
bindkey "^[f" vi-forward-word
bindkey "^F" end-of-line
bindkey "^[b" vi-backward-word
bindkey "^[^?" vi-backward-kill-word
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
export EDITOR="nvim"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/scripts/bin:$PATH"
export ZSH_EXTENSIONS="$HOME/.zsh"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zstyle ':completion:*' menu select

if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

upd () {
  if type pacman > /dev/null 2>&1; then
    pacsyu
    if type yay > /dev/null 2>&1; then
      yay -Syua
    fi
  fi
  if type apt > /dev/null 2>&1; then
    aptu
  fi
  if type dnf > /dev/null 2>&1; then
    dnfu
  fi
  if type zypper > /dev/null 2>&1; then
    zypu
  fi
  if type flatpak > /dev/null 2>&1; then
    flatu
  fi
}

d () {
  PS3='Select a directory: '
  oldifs=$IFS
  IFS=$'\n'
  select var in $(dirs -p)
  do
    \cd ${var/\~/"$HOME"}
    break
  done
  IFS=$oldifs
}

if [ ! -d $ZSH_EXTENSIONS ]
then
  mkdir $ZSH_EXTENSIONS
fi

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]
then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  if [ ! -d $ZSH_EXTENSIONS/zsh-autosuggestions ]
  then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_EXTENSIONS/zsh-autosuggestions
  fi
  source $ZSH_EXTENSIONS/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  if [ ! -d $ZSH_EXTENSIONS/zsh-syntax-highlighting ]
  then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_EXTENSIONS/zsh-syntax-highlighting
  fi
  source $ZSH_EXTENSIONS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if type zoxide &> /dev/null
then
  eval "$(zoxide init zsh)"
else
  if [ ! -d $ZSH_EXTENSIONS/z ]
  then
    git clone --depth=1 https://github.com/agkozak/zsh-z.git $ZSH_EXTENSIONS/z
    source $ZSH_EXTENSIONS/z/zsh-z.plugin.zsh
  fi
fi

if type starship &> /dev/null
then
  eval "$(starship init zsh)"
else
  if [ ! -d $ZSH_EXTENSIONS/spaceship ]
  then
    git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git $ZSH_EXTENSIONS/spaceship
  fi
  export SPACESHIP_CONFIG="$HOME/.config/spaceship.zsh"
  source $ZSH_EXTENSIONS/spaceship/spaceship.zsh
fi


autoload -Uz compinit; compinit
