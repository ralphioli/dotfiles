# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1~%{$fg[red]%}]$%{$reset_color%}%b "

# Auto-start tmux
if [[ "$TMUX" == "" ]]; then
  if [[ "$(pwd)" == "$HOME" ]]; then
    open-tmux
  else
    open-tmux $(basename $(pwd) | sed 's/\./_/g')
  fi
fi

# Save history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh_history

# Set default editor to vim
export EDITOR='vim'

# Edit file/open output in editor with ctrl-e
zle-edit () {
  if [[ $LBUFFER == "" ]]; then                           # Ctrl-e on empty buffer types "vim "
    LBUFFER="$EDITOR "
  elif [[ $LBUFFER == "$EDITOR " ]]; then                 # Double ctrl-e opens vim
    zle -w accept-line
  elif [[ -f $(echo $LBUFFER | awk '{$1=$1};1') ]]; then  # Ctrl-e with file on buffer opens file in vim
    LBUFFER="$EDITOR $LBUFFER"
    zle -w accept-line
  else                                                    # Else, pipe command output to vim
    LBUFFER="$LBUFFER | $EDITOR -"
    zle -w accept-line
  fi
}
zle -N zle-edit
bindkey '^e' zle-edit

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

# source aliases
[ -f "$HOME/.config/zsh/alias.sh" ] && source "$HOME/.config/zsh/alias.sh"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
