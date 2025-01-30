if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx GOPATH "$HOME/go"
    set -gx PATH "$PATH:$GOPATH/bin"
    if test -e ~/.aliases
      source ~/.aliases
    end

    if test -f /bin/pacman
      alias update='pacu && flatu'
    else if test -f /bin/apt
      alias update='aptu && flatu'
    else if test -f /bin/dnf
      alias update='dnfu && flatu'
    else if test -f /bin/zypper
      alias update='zypu && flatu'
    end

    if test (type -p starship != '')
      starship init fish | source
    end
    if test (type -p zoxide != '')
      zoxide init fish | source
    end
end
