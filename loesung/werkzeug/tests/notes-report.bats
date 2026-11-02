#!/usr/bin/env bats
# Tests für bin/notes-report

setup() {
  PATH="$BATS_TEST_DIRNAME/../bin:$PATH"
  fixture="$BATS_TEST_DIRNAME/fixtures/access.log"
}

@test "zählt Anfragen und Fehler" {
  run notes-report "$fixture"
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Anfragen: 8" ]
  [ "${lines[1]}" = "Fehler:   3 (37.5 %)" ]
}

@test "findet die langsamste Anfrage" {
  run notes-report "$fixture"
  [[ ${lines[2]} == *'max 50.0 ms ("GET /notes")' ]]
}

@test "fasst IDs zu /notes/:id zusammen" {
  run notes-report "$fixture"
  [[ $output == *"/notes/:id"* ]]
  [[ $output != *"/notes/7"* ]]
}

@test "leeres Log ist ein Fehler" {
  run notes-report /dev/null
  [ "$status" -eq 1 ]
  [[ $output == *"Log ist leer"* ]]
}
