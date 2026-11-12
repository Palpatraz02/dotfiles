# Environment
export PATH="$PATH:$HOME/.local/share/mise/shims:$HOME/.local/bin"
export EDITOR="${EDITOR:-nvim}"
export SUDO_EDITOR="${SUDO_EDITOR:-$EDITOR}"
export BAT_THEME=ansi
if (( $+commands[bat] && $+commands[col] )); then
  export MANROFFOPT='-c'
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
