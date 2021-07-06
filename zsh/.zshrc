# Theming
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~%{$fg[red]%}]$%{$reset_color%}%b "

# Auto-start tmux
# if [[ "$TMUX" == "" ]]; then
#   if [[ "$(pwd)" == "$HOME" ]]; then
#     open-tmux
#   else
#     open-tmux $(basename $(pwd) | sed 's/\./_/g')
#   fi
# fi

# Save history
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh_history

# Set default editor to vim
export EDITOR='vim'

# Ctrl-E: open stdout in Editor (vim)
zle-edit () {
  if [ "$LBUFFER" != "" ]; then
    LBUFFER="$LBUFFER | $EDITOR -"
    zle -w accept-line
  fi
}
zle -N zle-edit
bindkey '^e' zle-edit

# Ctrl-R: Read output (less)
zle-read () {
  if [ "$LBUFFER" != "" ]; then
    LBUFFER="$LBUFFER | less"
    zle -w accept-line
  fi
}
zle -N zle-read
bindkey '^r' zle-read

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -v '^?' backward-delete-char # Fix backspace

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# autocd
setopt autocd

# source aliases and functions
[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"
[ -f "$HOME/.config/shell/functions.sh" ] && source "$HOME/.config/shell/functions.sh"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
