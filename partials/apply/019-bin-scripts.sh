#!/usr/bin/env bash
(
  set -e
  set -u

  [[ -d "${USER_BINARIES_HOME}" ]] || mkdir -p "${USER_BINARIES_HOME}"
  stow -R -d "${SCRIPT_DIR}/files" -t "${USER_BINARIES_HOME}" --no-folding binaries
)
