# Prompt theme: Starship reads ~/.config/starship.toml by default.
(( $+commands[starship] )) && [[ ${TERM:-} != dumb ]] && eval "$(starship init zsh)"
