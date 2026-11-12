# Load the shared environment, then interactive shell settings in order.
source "$ZSH_CONFIG_DIR/environment.zsh"
[[ -o interactive ]] || return
source "$ZSH_CONFIG_DIR/history.zsh"
source "$ZSH_CONFIG_DIR/completion.zsh"
source "$ZSH_CONFIG_DIR/integrations.zsh"
source "$ZSH_CONFIG_DIR/shortcuts.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
# Syntax highlighting needs to be loaded after the other interactive settings.
source "$ZSH_CONFIG_DIR/plugins.zsh"
