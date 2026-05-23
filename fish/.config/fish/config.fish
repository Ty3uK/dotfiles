# path
fish_add_path $HOME/.local/bin

if test (uname) = "Darwin"
    fish_add_path /opt/homebrew/opt/sqlite/bin
    set -p fish_complete_path /opt/homebrew/share/fish/vendor_completions.d
end

# variables
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/config"

# intergrations
starship init fish | source
fnm env --use-on-cd --shell fish | source

# keymaps
bind alt-backspace backward-kill-word
bind alt-delete kill-word
bind alt-left backward-word
bind alt-right forward-word

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
