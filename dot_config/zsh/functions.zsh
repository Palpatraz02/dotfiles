# Archives and SSH forwarding.
compress() { (( $# == 1 )) || { print 'Usage: compress <path>'; return 1; }; tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress='tar -xzf'
fip() {
  (( $# >= 2 )) || { print 'Usage: fip <host> <port> [port...]'; return 1; }
  local host=$1 port; shift
  for port in "$@"; do command ssh -f -N -L "${port}:localhost:${port}" "$host" && print "Forwarding localhost:$port to $host:$port"; done
}
lip() { pgrep -af 'ssh.*-L [0-9]+:localhost:[0-9]+' || print 'No active forwards'; }
dip() {
  (( $# )) || { print 'Usage: dip <port> [port...]'; return 1; }
  local port
  for port in "$@"; do
    [[ $port == <-> ]] || { print -u2 "Invalid port: $port"; continue; }
    pkill -f "ssh.*-L ${port}:localhost:${port}" && print "Stopped forwarding port $port" || print "No forwarding on port $port"
  done
}

# Git worktree helper. Remove worktrees with explicit git commands.
ga() {
  (( $# == 1 )) || { print 'Usage: ga <new-branch>'; return 1; }
  local branch=$1 base=${PWD:t} wt_path
  wt_path="../${base}--${branch}"
  git worktree add -b "$branch" "$wt_path" || return
  (( $+commands[mise] )) && mise trust "$wt_path"
  builtin cd "$wt_path"
}
