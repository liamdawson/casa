#!/bin/bash

(
  set -e
  set -u

  _not_linux exit 0
if command -v latte-dock >/dev/null 2>&1
then
  killall latte-dock
  rm "${XDG_CONFIG_HOME}/latte/preferred.layout.latte" 2>/dev/null || true
  latte-dock --import-layout "${SCRIPT_DIR}/files/preferred.layout.latte" >/dev/null 2>&1 &
fi
)
