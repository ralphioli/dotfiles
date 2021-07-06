#!/bin/sh

# ls coolness
alias la='ls -A'
alias ll='la -lh'
alias ls='ls --color=auto'

alias md='mkdir -pv'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# tmux
alias tm=open-tmux
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# vim
alias e='$EDITOR'
alias se=sudoedit
alias v=vim

# youtube-dl
alias yt='youtube-dl -o '\''%(title)s.%(ext)s'\'' --no-playlist --restrict-filenames --add-metadata'
alias yta='yt -x -f bestaudio/best'
alias ytp='youtube-dl -o '\''%(playlist_title)s/%(playlist_index)03d-%(title)s.%(ext)s'\'' --yes-playlist --restrict-filenames --ignore-errors --add-metadata'
alias ytpa='ytp -x -f bestaudio/best'
