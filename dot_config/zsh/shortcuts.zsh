# File and directory shortcuts.
if (( $+commands[eza] )); then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi
# Use bat as a cat replacement without decorations or paging.
if (( $+commands[bat] )); then
  alias cat='bat --style=plain --paging=never'
fi
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
if (( $+commands[zoxide] )); then
  zd() {
    if (( $# == 0 )); then
      builtin cd ~
    elif [[ -d $1 ]]; then
      builtin cd "$1"
    else
      z "$@" && pwd
    fi
  }
  alias cd='zd'
fi

if (( $+commands[fzf] )); then
  ff() {
    if (( $+commands[bat] )); then
      if [[ ${TERM:-} == xterm-kitty ]] && (( $+commands[kitty] )); then
        fzf --preview 'case $(file --mime-type -b {}) in image/*) kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {} ;; *) bat --style=numbers --color=always {} ;; esac' "$@"
      else
        fzf --preview 'bat --style=numbers --color=always {}' "$@"
      fi
    else
      fzf "$@"
    fi
  }
  eff() { local file; file=$(ff) && [[ -n $file ]] && "${EDITOR}" "$file"; }
  sff() {
    (( $# == 1 )) || { print 'Usage: sff <destination>'; return 1; }
    local file
    file=$(find . -type f -printf '%T@\t%p\n' | sort -rn | cut -f2- | ff) && [[ -n $file ]] && scp "$file" "$1"
  }
fi
open() { (xdg-open "$@" >/dev/null 2>&1 &!) }

# Common Omarchy shortcuts (commands must be installed separately).
alias d='docker'
alias r='rails'
alias t='tmux attach || tmux new -s Work'
alias h='herdr'
alias c='opencode --auto'
alias cx='printf "\033[2J\033[3J\033[H" && claude --permission-mode auto'
alias cy='codex --approve-for-me'
alias mup='MISE_MINIMUM_RELEASE_AGE=0 mise up'
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
n() { if (( $# )); then command nvim "$@"; else command nvim .; fi; }
