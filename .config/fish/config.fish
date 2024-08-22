if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.aliases
    if test (type -p starship != '')
      starship init fish | source
    end
    if test (type -p zoxide != '')
      zoxide init fish | source
    end
end
