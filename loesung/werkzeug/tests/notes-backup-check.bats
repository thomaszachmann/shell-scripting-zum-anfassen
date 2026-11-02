#!/usr/bin/env bats
# Tests für bin/notes-backup-check, mit einem eigenen Ordner je Test

setup() {
  PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
  ziel="$BATS_TEST_TMPDIR/backups"
  mkdir -p "$ziel"
}

@test "frisches Backup ist ok" {
  touch "$ziel/notes-20260101-000000.sql.gz"
  run notes-backup-check -d "$ziel" 1
  [ "$status" -eq 0 ]
  [ "$output" = "ok: notes-20260101-000000.sql.gz" ]
}

@test "nur altes Backup ist ein Fehler" {
  touch -d '2 days ago' "$ziel/notes-alt.sql.gz"
  run notes-backup-check -d "$ziel" 24
  [ "$status" -eq 1 ]
}

@test "Text statt Zahl ist falsche Bedienung" {
  run notes-backup-check -d "$ziel" viele
  [ "$status" -eq 2 ]
}
