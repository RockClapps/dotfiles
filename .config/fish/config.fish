if status is-interactive
    # Commands to run in interactive sessions can go here
    set -gx EDITOR "nvim"
    set -gx GOPATH "$HOME/go"
    set -gx PATH "$GOPATH/bin:$PATH"
    set -gx PATH "$HOME/.cargo/bin:$PATH"
    set -gx PATH "$HOME/scripts/bin:$PATH"
    if test -e ~/.aliases
      cat ~/.aliases | 
        string replace --all alias abbr | 
        string replace = ' -a ' | 
        source
    end

    function upd
      if type -q pacman
        sudo pacman -Syu
        if type -q yay
          yay -Syua
        end
      end
      if type -q apt
        sudo apt update && sudo apt upgrade
      end
      if type -q dnf
        sudo dnf update
      end
      if type -q zypper
        sudo zypper update
      end
      if type -q flatpak
        flatpak update
      end
    end

    if type -q starship
      starship init fish | source
    end
    if type -q zoxide
      zoxide init fish | source
    end

    function multicd
      echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    function pacmanAbbrev
      set arguments (string sub -s 4 $argv[1])
      set first (string upper (string sub -e 1 $arguments))
      set sudo ''
      if test $first = 'S' || test $first = 'R' || test $first = 'U'
        set sudo 'sudo '
      end
      if test (string sub -e 2 $arguments) = 'ss'
        set sudo ''
      end
      echo "$sudo"pacman -$first(string sub -s 2 $arguments)
    end
    abbr --add pacmanAbbrev --regex '^pac[^m]*' --function pacmanAbbrev

end
