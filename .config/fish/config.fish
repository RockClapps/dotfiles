if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR "nvim"
    set -gx GOPATH "$HOME/go"
    set -gx PATH "$GOPATH/bin:$PATH"
    set -gx PATH "$HOME/.cargo/bin:$PATH"
    set -gx PATH "$HOME/scripts/bin:$PATH"
    if test -e ~/.aliases
      source ~/.aliases
    end

    function update
      if test -f /bin/pacman
        pacu
        if test -f /bin/yay
          yay -Syua
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

    if type -q starship
      starship init fish | source
    end
    if type -q zoxide
      zoxide init fish | source
    end
end
