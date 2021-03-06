# No, no, no!
status --is-interactive; or exit 1

# PATH
set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/flutter/bin $fish_user_paths

# Base
set -x EDITOR 'nvim'
set -x VISUAL $EDITOR
set -x PAGER 'less -R'
set -x MANPAGER 'less -X'
set -x LESS '--ignore-case --chop-long-lines --long-prompt --silent'
set -x GREP_OPTIONS '--color=auto'
set -x LSCOLORS 'ExGxBxDxCxEgEdxbxgxcxd'
set -x LANG 'en_US.UTF-8'
set -x LC_CTYPE 'en_US.UTF-8'
set -x LC_MESSAGES 'en_US.UTF-8'
set -x LC_COLLATE 'C'



# Aliases

alias ls "exa --oneline --grid"
alias lt "exa --tree"
alias ll "exa --long --icons --header"
alias la "exa --long --icons --header --all"
alias lg "exa --long --icons --header --all --git"
alias lb "exa --long --icons --header --all --links"


# Fish
set fish_greeting ''

set fish_color_comment blue
set fish_color_command brmagenta
set fish_color_param white
set fish_color_quote brred
set fish_color_error red
set fish_color_redirection yellow
set fish_color_operator brred
set fish_color_autosuggestion brgreen
set fish_color_selection --background=blue
set fish_color_end brred

set fish_color_prompt_git_fg white
set fish_color_prompt_git_bg brred
set fish_color_prompt_status_fg white
set fish_color_prompt_status_bg red
set fish_color_prompt_timing_fg white
set fish_color_prompt_timing_bg magenta

set fish_color_prompt_pwd_fg blue
set fish_color_prompt_pwd_bg brblack
set fish_color_prompt_root_fg brblue
set fish_color_prompt_root_bg red
set fish_color_prompt_venv_fg white
set fish_color_prompt_venv_bg magenta

set fish_color_mode_string_normal 'NORMAL'
set fish_color_mode_string_insert 'INSERT'
set fish_color_mode_string_replace 'REPLACE'
set fish_color_mode_string_visual 'VISUAL'
set fish_color_mode_color_normal blue
set fish_color_mode_color_insert green
set fish_color_mode_color_replace red
set fish_color_mode_color_visual magenta

set cmd_timing_limit 5