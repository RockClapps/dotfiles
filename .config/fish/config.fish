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

    function upd
      if type -q pacman
        pacu
        if type -q yay
          yay -Syua
        end
      end
      if type -q apt
        aptu
      end
      if type -q dnf
        dnfu
      end
      if type -q zypper
        zypu
      end
      if type -q flatpak
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
