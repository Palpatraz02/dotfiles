# History: append, skip duplicates and commands starting with a space.
HISTFILE="${HISTFILE:-$HOME/.zsh_history}"
HISTSIZE=32768
SAVEHIST=32768
setopt APPEND_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE
