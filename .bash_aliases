alias l="ls -ahlF --color=auto"
alias xyeys="xeyes"
alias hackswitch="sudo python3 ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/fusee-launcher.py ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/pls/payload.bin"
alias switchloader="sudo -E java -jar ~/MEGA/Game\ Saves/Switch\ Hacking/ns-usbloader-7.1.jar"
alias suedit="sudo nvim -u ~/.config/nvim/init-root.lua"
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias lazydotfiles='lazygit -g "$HOME/.dotfiles" -w "$HOME"'
alias ubuntu='cd ~/UbuntuHome; distrobox enter ubuntu'
alias stopubuntu='distrobox stop ubuntu'

alias flati="sudo flatpak install"
alias flatr="sudo flatpak remove --delete-data"
alias flatu="sudo flatpak update"
alias flats="flatpak search"

alias zypi="sudo zypper install"
alias zypr="sudo zypper remove --clean-deps"
alias zypu="sudo zypper refresh && sudo zypper dist-upgrade --details"
alias zyps="zypper search"

alias update="zypu && flatu"
