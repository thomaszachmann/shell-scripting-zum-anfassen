# Shell-Scripting zum Anfassen – Begleitcode

Begleitcode zum Buch **Shell-Scripting zum Anfassen** – Bash vom ersten Skript bis zum Betrieb. Teil der Reihe IT-Trainingslager von Thomas Zachmann.

Buchseite: https://it-trainingslager.de/buecher/shell-scripting

Der Code begleitet das Buch; Erklärungen und Übungen stehen im Buch. Alle Schlüssel und Passwörter sind Laborwerte – nie in Produktion verwenden.

## Inhalt

- `setup/` – `env.sh` mit `NOTES_URL`, `NOTES_API_KEY`, `NOTES_LOG` und dem Werkzeugkasten im `PATH`
- `notes/` – Quellcode von notes-api (Go), der Anwendung, die die Skripte betreuen
- `notes-stack/` – notes mit Postgres und nginx davor, das ein Zugriffslog schreibt (Tag 0)
- `loesung/werkzeug/` – der fertige Werkzeugkasten nach Anhang B: Skripte, `lib.sh`, bats-Tests, `ci.sh`
- `loesung/systemd/` – die systemd-Units aus Tag 13 und Anhang B

## Schnellstart

```bash
git clone https://github.com/thomaszachmann/shell-scripting-zum-anfassen.git ~/sh-lab/code
```

Details stehen im Kapitel „Tag 0“ des Buchs.

## Lizenz

Code: MIT (siehe LICENSE). Buchtexte, Abbildungen und Cover sind nicht Teil dieses Repos und nicht lizenziert.
