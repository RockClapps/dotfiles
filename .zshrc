export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

alias suedit='sudo nvim -u ~/.config/nvim/init-compat'
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias lazydotfiles='lazygit -g "$HOME/.dotfiles" -w "$HOME"'

fpath+="$ZSH/themes/pure"
ZSH_THEME='pure'

plugins=(
  archlinux
  git
  history-substring-search
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [ ! -d $ZSH ];
then
  mkdir ~/.oh-my-zsh
  pushd ~/.oh-my-zsh
  git clone https://github.com/ohmyzsh/ohmyzsh.git .
  git clone https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting
  git clone https://github.com/sindresorhus/pure.git themes/pure
  ln -rs themes/pure/pure.zsh themes/pure.zsh-theme
  popd
fi
source $ZSH/oh-my-zsh.sh

