if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.bash_aliases
    thefuck --alias | source
    starship init fish | source
end


