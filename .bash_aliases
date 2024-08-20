alias l='ls -AGXhl --group-directories-first --color=auto'
alias xyeys='xeyes'
alias hackswitch='sudo python3 ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/fusee-launcher.py ~/MEGA/Game\ Saves/Switch\ Hacking/fusee-launcher-1.0/pls/payload.bin'
alias switchloader='sudo -E java -jar ~/MEGA/Game\ Saves/Switch\ Hacking/ns-usbloader-7.1.jar'
alias suedit='sudo nvim -u ~/.config/nvim/init-compat'
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
alias lazydotfiles='lazygit -g "$HOME/.dotfiles" -w "$HOME"'

alias gstat='git status'
alias gcom='git commit -m'
alias gpush='git push'
alias gpull='git pull'

alias flati='sudo flatpak install'
alias flatr='sudo flatpak remove --delete-data'
alias flatu='sudo flatpak update'
alias flats='flatpak search'

alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rsn'
alias pacu='sudo pacman -Syu'
alias pacs='pacman -Ss'

alias update='pacu && flatu'
