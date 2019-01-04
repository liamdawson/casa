# shellcheck shell=bash

alias docs.rs="cargo doc --open --no-deps -p"
(! command -v 'direnv' >/dev/null 2>&1) || alias dx="direnv exec ."

if command -v 'op' >/dev/null 2>&1
then
  function ope() {
    eval "$(op signin $1)"
  }
fi

if command -v 'convox' >/dev/null 2>&1
then
  function convox-exec() {
    if [[ $# -lt 2 ]]
    then
      echo 'usage: <service id> cmd...'
    else
      SERVICE_ID="$1"
      shift
      convox exec "$SERVICE_ID" "$@"
    fi
  }
fi
