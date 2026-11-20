# Shell scripting hands-on – Companion Code

Companion code for the book **Shell scripting hands-on** (German edition: *Shell-Scripting zum Anfassen*) – Bash from your first script to production. Part of Thomas Zachmann's IT Drills series.

Book page: https://itdrills.com/books/shell-scripting · German edition: https://it-trainingslager.de/buecher/shell-scripting

The code accompanies the book; explanations and exercises are in the book. All keys and passwords are lab values – never use them in production.

## Contents

- `setup/` – `env.sh` with `NOTES_URL`, `NOTES_API_KEY`, `NOTES_LOG` and the toolbox in `PATH`
- `notes/` – source code of notes-api (Go), the application the scripts look after
- `notes-stack/` – notes with Postgres and nginx in front, which writes an access log (Day 0)
- `loesung/werkzeug/` – the finished toolbox after Appendix B: scripts, `lib.sh`, bats tests, `ci.sh`
- `loesung/systemd/` – the systemd units from Day 13 and Appendix B

## Quick start

```bash
git clone https://github.com/thomaszachmann/shell-scripting-zum-anfassen.git ~/sh-lab/code
```

Details are in the book's "Day 0" chapter.

## License

Code: MIT (see LICENSE). Book text, figures and cover are not part of this repo and are not licensed.
