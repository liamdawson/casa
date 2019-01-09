#!/bin/bash

(
  DOWNLOAD_URL="https://fonts.google.com/download?family=Roboto%20Mono"

  set -e
  set -u

  function linux_install() {
  if [[ ! -r "${XDG_DATA_HOME}/fonts/RobotoMono-Regular.ttf" ]]
  then
    mkdir -p "${XDG_DATA_HOME}/fonts" || true
    curl -o robotomono.zip -sSL "$DOWNLOAD_URL"
    unzip -j -o -qq robotomono.zip -d "${XDG_DATA_HOME}/fonts"
    rm robotomono.zip

    fc-cache
  fi
  }

  function macos_install() {
    if [[ ! -r "${HOME}/Library/Fonts/RobotoMono-Regular.ttf" ]]
    then
      curl -o robotomono.zip -sSL "$DOWNLOAD_URL"
      unzip -j -o -qq robotomono.zip -d "${HOME}/Library/Fonts"
      rm robotomono.zip
    fi
  }

  _linux_only linux_install
  _macos_only macos_install
)