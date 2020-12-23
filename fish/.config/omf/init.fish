# Custom colors
set -xg fish_color_command        brgreen
set -xg fish_color_quote          yellow
set -xg fish_color_param          white
set -xg fish_color_error          brred
set -xg fish_color_autosuggestion brblack
set -xg fish_color_comment        brblack

# Custom bobthefish theme settings
set -xg theme_powerline_fonts      no
set -xg theme_display_date         no
set -xg theme_display_cmd_duration no
set -xg theme_display_user         no
set -xg theme_display_hostname     ssh
set -xg theme_newline_cursor       no

# Shortcuts
abbr l="ls -Alh"
abbr mk="mkdir -p"
abbr rm="rm -rf"

abbr du="du -h"
abbr df="df -h"
abbr free="free -h"

abbr yt="youtube-dl"
abbr md="grip -b"

abbr v="vim"
abbr vimrc="vim ~/.vimrc"

alias :q="exit"
alias gitroot="cd ./(git rev-parse --show-cdup)"
