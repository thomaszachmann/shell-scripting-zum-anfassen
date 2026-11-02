# lib.sh – gemeinsame Funktionen für den Werkzeugkasten. Laden mit: source …/lib.sh
# shellcheck shell=bash
[[ -n "${_LIB_SH:-}" ]] && return 0
_LIB_SH=1

PROG="${0##*/}"

log() { printf '%s %s: %s\n' "$(date +%H:%M:%S)" "$PROG" "$*" >&2; }
info() { log "INFO $*"; }
warn() { log "WARN $*"; }
die() {
  log "FEHLER $1"
  exit "${2:-1}"
}

# need prog…  – bricht mit Exit-Code 3 ab, wenn ein Programm fehlt
need() {
  local p
  for p in "$@"; do
    command -v "$p" >/dev/null || die "Programm fehlt: $p" 3
  done
}

notes_url() { printf '%s\n' "${NOTES_URL:-http://127.0.0.1:8080}"; }

# retry anzahl befehl…  – wiederholt einen Befehl, bis er klappt
retry() {
  local max=$1 versuch=1 rc
  shift
  while true; do
    rc=0
    "$@" || rc=$?
    ((rc == 0)) && return 0
    ((versuch >= max)) && return "$rc"
    warn "Versuch $versuch/$max: $* (Exit $rc)"
    versuch=$((versuch + 1))
    sleep 1
  done
}

# notes_compose args…  – docker compose für den notes-Stack
notes_compose() {
  docker compose -f "${NOTES_COMPOSE:-$HOME/sh-lab/notes/compose.yaml}" "$@"
}
