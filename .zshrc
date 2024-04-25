zstyle :compinstall filename '/home/rock/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -e

source ~/.bash_aliases

if [ -f ~/Zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source ~/Zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f ~/Zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source ~/Zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
if [ -f ~/Zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
	source ~/Zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=0
	HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
fi

if [ -f ~/Zsh/powerlevel10k/powerlevel10k.zsh-theme ]; then
	source ~/.p10k.zsh
	source ~/Zsh/powerlevel10k/powerlevel10k.zsh-theme
fi

if [ -f /usr/bin/zoxide ]; then
	eval "$(zoxide init zsh)"
fi
