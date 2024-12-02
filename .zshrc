export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/scripts/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

fpath+="$ZSH/themes/pure"
ZSH_THEME='pure'

plugins=(
  history-substring-search
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [ ! -d $ZSH ];
then
  mkdir ~/.oh-my-zsh
  pushd ~/.oh-my-zsh
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git .
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/sindresorhus/pure.git themes/pure
  ln -rs themes/pure/pure.zsh themes/pure.zsh-theme
  popd
fi
source $ZSH/oh-my-zsh.sh

if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

