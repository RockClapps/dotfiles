if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx GOPATH "$HOME/go"
    set -gx PATH "$PATH:$GOPATH/bin"
    if test -e ~/.aliases
      source ~/.aliases
    end

    function update
      if test -f /bin/pacman
        pacu
        if test -f /bin/yay
          yay -Syu
        end
      end
      if test -f /bin/apt
        aptu
      end
      if test -f /bin/dnf
        dnfu
      end
      if test -f /bin/zypper
        zypu
      end
      if test -f /bin/flatpak
        flatu
      end
    end

    if test (type -p starship != '')
      starship init fish | source
    end
    if test (type -p zoxide != '')
      zoxide init fish | source
    end
end
