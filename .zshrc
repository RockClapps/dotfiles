HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey "^[f" vi-forward-word
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

if [ ! -d $ZSH_EXTENSIONS ];
then
  mkdir $ZSH_EXTENSIONS
  pushd $ZSH_EXTENSIONS
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
  git clone --depth=1 https://github.com/agkozak/zsh-z.git z
  git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git spaceship
  popd
fi

source $ZSH_EXTENSIONS/z/zsh-z.plugin.zsh
autoload -Uz compinit; compinit

export SPACESHIP_CONFIG="$HOME/.config/spaceship.zsh"
source $ZSH_EXTENSIONS/spaceship/spaceship.zsh

source $ZSH_EXTENSIONS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_EXTENSIONS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

