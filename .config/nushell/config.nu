$env.config.show_banner = false
$env.EDITOR = "nvim"
$env.GOPATH = $env.HOME | path join "go"
$env.PATH = [ ($env.GOPATH | path join "bin") ] ++ $env.PATH
$env.PATH = [ ($env.HOME | path join ".cargo/bin") ] ++ $env.PATH
$env.PATH = [ ($env.HOME | path join "scripts/bin") ] ++ $env.PATH
let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | from tsv --flexible --noheaders --no-infer
    | rename value description
}
$env.config.completions.external = {
    enable: true
    max_results: 100
    completer: $fish_completer
}

#ALIASES
alias please = sudo
def l [folder = '.'] {
  ls --all $folder | sort-by type
}
alias please = sudo
alias suedit = sudo nvim -u ~/.config/nvim/init-compat
alias dotfiles = git --git-dir=($env.HOME | path join .dotfiles) --work-tree=($env.HOME)
alias lazydotfiles = lazygit -g ($env.HOME | path join .dotfiles) -w $env.HOME

alias gst = git status
alias gdf = git diff
alias gdfn = git diff --name-only
alias gcom = git commit -m
alias gcoa = git commit --amend
alias gadd = git add
alias gaddp = git add -p
alias grm = git remove --cached
alias gsw = git switch
alias gsta = git stash
alias gstap = git stash pop --index
alias gstac = git stash clear
alias gstas = git stash show
alias glog = git log
alias gpush = git push
alias gpushf = git push --force-with-lease
alias gpull = git pull

alias flati = flatpak install
alias flatr = flatpak remove --delete-data
alias flatu = flatpak update
alias flats = flatpak search

alias paci = sudo pacman -S
alias pacr = sudo pacman -Rsn
alias pacu = sudo pacman -Syu
alias pacs = pacman -Ss
alias pacsi = pacman -Si
alias pacq = pacman -Q
alias pacql = pacman -Ql

alias apti = sudo apt install
alias aptr = sudo apt remove
def aptu [] { sudo apt update; sudo apt upgrade }
alias apts = apt search

alias dnfi = sudo dnf install
alias dnfr = sudo dnf remove
alias dnfu = sudo dnf update
alias dnfs = dnf search

alias zypi = sudo zypper install
alias zypr = sudo zypper remove
alias zypu = sudo zypper update
alias zyps = zypper search

def upd [] { 
  if ('/bin/pacman' | path exists) {
    pacu; flatu
  }
  if ('/bin/apt' | path exists) {
    aptu; flatu
  }
  if ('/bin/dnf' | path exists) {
    dnfu; flatu
  }
  if ('/bin/zypu' | path exists) {
    zypu; flatu
  }
}

#ALIASES

#STARSHIP
export-env { $env.STARSHIP_SHELL = "nu"; load-env {
    STARSHIP_SESSION_KEY: (random chars -l 16)
    PROMPT_MULTILINE_INDICATOR: (
        ^/usr/bin/starship prompt --continuation
    )

    # Does not play well with default character module.
    # TODO: Also Use starship vi mode indicators?
    PROMPT_INDICATOR: ""

    PROMPT_COMMAND: {||
        # jobs are not supported
        (
            ^/usr/bin/starship prompt
                --cmd-duration $env.CMD_DURATION_MS
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
        )
    }

    config: ($env.config? | default {} | merge {
        render_right_prompt_on_last_line: true
    })

    PROMPT_COMMAND_RIGHT: {||
        (
            ^/usr/bin/starship prompt
                --right
                --cmd-duration $env.CMD_DURATION_MS
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
        )
    }
}}
#STARSHIP
