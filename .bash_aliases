alias xyeys="xeyes"
alias hackswitch="sudo python ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/fusee-launcher.py ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/pls/payload.bin"
alias switchloader="sudo java -jar ~/MEGA/Game\ Saves/Switch\ Hacking/ns-usbloader-7.1.jar"
alias suedit="sudo nvim -u ~/.config/nvim/init-root.lua"
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias lazydotfiles='lazygit -g "$HOME/.dotfiles" -w "$HOME"'

alias tb="toolbox enter"
if [ -f /usr/bin/dnf ]; then
	alias dnfi="sudo dnf5 install"
	alias dnfr="sudo dnf5 remove"
	alias dnfu="sudo dnf5 update"
	alias dnfs="dnf5 search"
fi
