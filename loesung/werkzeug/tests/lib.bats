#!/usr/bin/env bats
# Tests für lib/lib.sh

setup() {
  source "$BATS_TEST_DIRNAME/../lib/lib.sh"
}

@test "need findet vorhandene Programme" {
  run need bash curl
  [ "$status" -eq 0 ]
}

@test "need bricht mit Exit-Code 3 ab" {
  run need gibtsnicht
  [ "$status" -eq 3 ]
  [[ $output == *"Programm fehlt: gibtsnicht"* ]]
}

@test "notes_url hat einen Standard" {
  unset NOTES_URL
  run notes_url
  [ "$output" = "http://127.0.0.1:8080" ]
}

@test "retry gibt nach der erlaubten Anzahl auf" {
  run retry 2 false
  [ "$status" -eq 1 ]
  [ "${#lines[@]}" -eq 1 ]
}
