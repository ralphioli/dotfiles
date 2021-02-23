# Edit this file, and some others as well
alias vialias='vim ~/.oh-my-zsh/custom/alias.zsh'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'

# Better defaults
alias md='mkdir -p'
alias df='df -h' # -h for human-readable sizes
alias du='du -h'

# System stats
alias ram='watch free -h'   # Monitor ram/swap usage
alias nv='watch nvidia-smi' # Monitor nvidia gpu usage

# Git root
alias gr='cd ./$(git rev-parse --show-cdup)'

# Vim
alias v='vim'

# Misc
alias yt='youtube-dl'
alias grip='grip -b'
alias tx='tmuxinator'
