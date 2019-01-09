#!/bin/bash

(
  DOWNLOAD_URL="https://noto-website-2.storage.googleapis.com/pkgs/NotoColorEmoji-unhinted.zip"

  set -e
  set -u

  # TODO: needed on other platforms?
  _not_linux exit 0

  if [[ ! -r "${XDG_DATA_HOME}/fonts/NotoColorEmoji.ttf" ]]
  then
    mkdir -p "${XDG_DATA_HOME}/fonts" || true
    curl -o notocoloremoji.zip -sSL "$DOWNLOAD_URL"
    unzip -j -o -qq notocoloremoji.zip -d "${XDG_DATA_HOME}/fonts" NotoColorEmoji.ttf
    rm notocoloremoji.zip

    fc-cache
  fi
)
