# Optional integrations. Install only the tools you want to use.
(( $+commands[mise] )) && eval "$(mise activate zsh)"
source "$ZSH_CONFIG_DIR/theme.zsh"
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
if (( $+commands[fzf] )); then
  if [[ -r /usr/share/fzf/key-bindings.zsh ]]; then
    source /usr/share/fzf/key-bindings.zsh
    [[ -r /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
  else
    eval "$(fzf --zsh 2>/dev/null)"
  fi
fi
