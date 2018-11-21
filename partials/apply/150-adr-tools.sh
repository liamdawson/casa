#!/bin/bash

(
  set -e
  set -u
  DOWNLOAD_URL="https://github.com/npryce/adr-tools/archive/3.0.0.tar.gz"
  DEST_DIR="${XDG_DATA_HOME}/adr-tools"

  if ! command -v adr >/dev/null 2>&1
  then
    [[ -d "$DEST_DIR" ]] || mkdir -p "$DEST_DIR"
    curl -sSL "$DOWNLOAD_URL" | tar -xz --directory="$DEST_DIR" --strip-components=1
  fi
)
