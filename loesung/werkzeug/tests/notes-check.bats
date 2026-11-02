#!/usr/bin/env bats
# Tests für bin/notes-check, ohne Netz

setup() {
  PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
}

@test "unbekannte Option endet mit 2" {
  run notes-check -x
  [ "$status" -eq 2 ]
  [[ $output == *"unbekannte Option -x"* ]]
}

@test "-h zeigt die Hilfe" {
  run notes-check -h
  [ "$status" -eq 0 ]
  [[ ${lines[0]} == "Aufruf: notes-check"* ]]
}
