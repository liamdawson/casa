#!/usr/bin/env bash
(
  set -e
  set -u

  stow -R -d "${SCRIPT_DIR}/files" -t "/usr/local/bin" --no-folding system-binaries
)
