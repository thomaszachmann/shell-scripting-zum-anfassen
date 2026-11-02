#!/usr/bin/env bash
# ci.sh – prüft den Werkzeugkasten, lokal und in der CI
set -euo pipefail
cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
echo "== shellcheck"
shellcheck -x bin/* lib/lib.sh ci.sh
echo "== shfmt"
shfmt -d bin lib ci.sh
echo "== bats"
bats --tap tests
echo "ci: alles grün"
