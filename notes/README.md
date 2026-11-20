# notes – demo application for *Shell scripting hands-on* (German: *Shell-Scripting zum Anfassen*)

notes-api (Go) stores notes in Postgres. In the book, nginx sits in front of it
(`../notes-stack`) and writes an access log that the scripts analyze.

- `POST /notes` creates a note and requires the `X-API-Key` header
  (lab value `lab-api-key-123`).
- `GET /notes` lists all notes as JSON, `GET /healthz` answers `ok`,
  `GET /version` with the version, `GET /metrics` with metrics in Prometheus format.
- `notes-api migrate` creates the table (idempotent).

Build (Day 0): `docker build --build-arg VERSION=0.4.0 -t notes-api:0.4.0 notes-api`
