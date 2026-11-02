# setup/env.sh – zu Beginn jedes Trainingstags einlesen: source ~/sh-lab/setup/env.sh
export LAB="$HOME/sh-lab"
export NOTES_URL="http://127.0.0.1:8080"           # notes hinter nginx
export NOTES_API_KEY="lab-api-key-123"             # nur Labor
export NOTES_LOG="$LAB/notes/logs/access.log"      # Zugriffslog von nginx
case ":$PATH:" in
  *":$LAB/werkzeug/bin:"*) ;;
  *) export PATH="$LAB/werkzeug/bin:$PATH" ;;       # eigene Skripte zuerst
esac
true
