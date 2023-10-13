if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

alias giti="git add . && git commit -m 'x'"
alias nvimrc="cd $HOME/.config/nvim && nvim ."
alias fishrc="cd $HOME/.config/fish && nvim ."
alias wezrc="cd $HOME/.config/wezterm && nvim ."

set NEOCONF "/Users/kenneth/.config/nvim"
set FISHCONF "$HOME/.config/fish/"
set WEZCONF "$HOME/.config/wezterm/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/kenneth/miniconda3/bin/conda
    eval /Users/kenneth/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

