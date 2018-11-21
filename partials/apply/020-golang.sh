#!/usr/bin/env bash

(
  set -e
  set -u

  if [[ ! -d "${GOENV_ROOT}" ]]
  then
    git clone https://github.com/syndbg/goenv.git "${GOENV_ROOT}"
  fi

  echo '1.11.2' > "${GOENV_ROOT}/version"
  goenv install -s "$(cat ${GOENV_ROOT}/version)"
)
