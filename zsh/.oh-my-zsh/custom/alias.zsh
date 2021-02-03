# Better defaults
alias md='mkdir -p'

# -h for human-readable sizes
alias df='df -h'
alias du='du -h'

# System stats
alias ram='watch free -h'   # Monitor ram/swap usage
alias nv='watch nvidia-smi' # Monitor nvidia gpu usage

# Git root
alias gr='cd ./$(git rev-parse --show-cdup)'

# Vim
alias v='vim'
alias vimrc='vim ~/.vimrc'

# Misc
alias yt='youtube-dl'
alias grip='grip -b'
alias tx='tmuxinator'
