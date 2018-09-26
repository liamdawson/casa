#!/usr/bin/env bash

(
  set -e
  set -u

  _not_linux exit 0

  DOWNLOAD_URL="https://discordapp.com/api/download?platform=linux&format=tar.gz"

  if [[ ! -d "${XDG_DATA_HOME}/Discord" ]]
  then
    curl -sSL "$DOWNLOAD_URL" | tar -xz --directory "${XDG_DATA_HOME}"
    "${XDG_DATA_HOME}/Discord/Discord" >/dev/null 2>&1 &
  fi
)
