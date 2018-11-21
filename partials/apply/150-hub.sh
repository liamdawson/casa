#!/bin/bash

(
  set -e
  set -u
  # TODO: macOS
  DOWNLOAD_ARCH=$(uname -m | sed -Ee 's/x86_64/amd64/')
  DOWNLOAD_PLATFORM=$(uname -s | tr 'A-Z' 'a-z')

  HUB_URL="https://github.com/github/hub/releases/download/v2.5.1/hub-${DOWNLOAD_PLATFORM}-${DOWNLOAD_ARCH}-2.5.1.tgz"

  if ! which hub >/dev/null 2>&1
  then
    TAR_COMMAND="tar"
    if command -v gtar >/dev/null 2>&1
    then
      TAR_COMMAND="gtar"
    fi

    curl -sSL "$HUB_URL" | $TAR_COMMAND -xz --strip-components=2 --directory="${USER_BINARIES_HOME}" --wildcards '*/bin/hub'
  fi
)
