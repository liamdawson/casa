# shellcheck shell=bash

alias docs.rs="cargo doc --open --no-deps -p"
(! command -v 'direnv' >/dev/null 2>&1) || alias dx="direnv exec ."

if command -v 'op' >/dev/null 2>&1
then
  function ope() {
    eval "$(op signin $1)"
  }
fi

