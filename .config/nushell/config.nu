$env.config.show_banner = false
$env.EDITOR = "nvim"
$env.GOPATH = $env.HOME | path join "go"
$env.PATH = [ ($env.GOPATH | path join "bin") ] ++ $env.PATH
$env.PATH = [ ($env.HOME | path join ".cargo/bin") ] ++ $env.PATH
$env.PATH = [ ($env.HOME | path join "scripts/bin") ] ++ $env.PATH
let fish_completer = {|spans|
    fish --command $"complete '--do-complete=($spans | str replace --all "'" "\\'" | str join ' ')'"
    | from tsv --flexible --noheaders --no-infer
    | rename value description
    | update value {|row|
      let value = $row.value
      let need_quote = ['\' ',' '[' ']' '(' ')' ' ' '\t' "'" '"' "`"] | any {$in in $value}
      if ($need_quote and ($value | path exists)) {
        let expanded_path = if ($value starts-with ~) {$value | path expand --no-symlink} else {$value}
        $'"($expanded_path | str replace --all "\"" "\\\"")"'
      } else {$value}
    }
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

alias pacs = sudo pacman -S
alias pacrsn = sudo pacman -Rsn
alias pacsyy = sudo pacman -Syy
alias pacsyu = sudo pacman -Syu
alias pacsyyu = sudo pacman -Syyu
alias pacss = pacman -Ss
alias pacsi = pacman -Si
alias pacq = pacman -Q
alias pacql = pacman -Ql
alias pacqs = pacman -Qs
alias pacqsq = pacman -Qsq
alias pacu = sudo pacman -U

alias apti = sudo apt install
alias aptr = sudo apt remove
def aptu [] { sudo apt update; sudo apt upgrade }
alias apts = apt search

alias dnfi = sudo dnf install
alias dnfr = sudo dnf remove
alias dnfu = sudo dnf update
alias dnfs = dnf search
alias rpm-ostree = flatpak-spawn --host sudo -S rpm-ostree

alias zypi = sudo zypper install
alias zypr = sudo zypper remove
alias zypu = sudo zypper update
alias zyps = zypper search

def upd [] { 
  if (which pacman | is-not-empty) {
    pacsyu
    if (which yay | is-not-empty) {
      yay -Syua
    }
  }
  if (which apt | is-not-empty) {
    aptu
  }
  if (which dnf | is-not-empty) {
    dnfu
  }
  if (which zypu | is-not-empty) {
    zypu
  }

  if (which flatpak | is-not-empty) {
    flatu
  }
}

#ALIASES

#STARSHIP
if (which starship | is-not-empty) {
  export-env { $env.STARSHIP_SHELL = "nu"; load-env {
      STARSHIP_SESSION_KEY: (random chars -l 16)
      PROMPT_MULTILINE_INDICATOR: (
          ^/usr/bin/starship prompt --continuation
      )
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
}
#STARSHIP

#ZOXIDE
if (not ($env | default false __zoxide_hooked | get __zoxide_hooked)) {
  $env.__zoxide_hooked = true
  $env.config = ($env | default {} config).config
  $env.config = ($env.config | default {} hooks)
  $env.config = ($env.config | update hooks ($env.config.hooks | default {} env_change))
  $env.config = ($env.config | update hooks.env_change ($env.config.hooks.env_change | default [] PWD))
  $env.config = ($env.config | update hooks.env_change.PWD ($env.config.hooks.env_change.PWD | append {|_, dir|
    if (which zoxide | is-not-empty) {
      zoxide add -- $dir
    }
  }))
}

def --env --wrapped __zoxide_z [...rest:string] {
  let arg0 = ($rest | append '~').0
  let arg0_is_dir = (try {$arg0 | path expand | path type}) == 'dir'
  let path = if (($rest | length) <= 1) and ($arg0 == '-' or $arg0_is_dir) {
    $arg0
  } else {
    (zoxide query --exclude $env.PWD -- ...$rest | str trim -r -c "\n")
  }
  cd $path
}

def --env --wrapped __zoxide_zi [...rest:string] {
  cd $'(zoxide query --interactive -- ...$rest | str trim -r -c "\n")'
}
alias z = __zoxide_z
alias zi = __zoxide_zi
#ZOXIDE
