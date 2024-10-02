export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export ZSH="$HOME/.oh-my-zsh"

alias hackswitch='sudo python3 ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/fusee-launcher.py ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/pls/payload.bin'
alias switchloader='java -jar ~/MEGA/Game\ Saves/Switch\ Hacking/ns-usbloader-7.1.jar'
alias suedit='sudo nvim -u ~/.config/nvim/init-compat'
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias lazydotfiles='lazygit -g "$HOME/.dotfiles" -w "$HOME"'

ZSH_THEME="agnoster"

plugins=(git z archlinux history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

if [ ! -d $ZSH ];
then
  mkdir ~/.oh-my-zsh
  pushd ~/.oh-my-zsh
  git clone https://github.com/ohmyzsh/ohmyzsh.git .
  git clone https://github.com/zsh-users/zsh-autosuggestions.git plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git plugins/zsh-syntax-highlighting
  popd
fi
source $ZSH/oh-my-zsh.sh

