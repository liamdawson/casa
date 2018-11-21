#!/usr/bin/env

(
  set -e
  set -u

  _not_linux exit 0

  FOLDER="${XDG_DATA_HOME}/Etcher"
  # TODO: macos
  DOWNLOAD_URL="https://github.com/balena-io/etcher/releases/download/v1.4.6/etcher-electron-1.4.6-linux-x64.zip"

  ## install Jetbrains toolbox, if it's missing
  if [[ ! -d "${FOLDER}" ]]
  then
    curl -sSL "$DOWNLOAD_URL" -o "etcher.zip" && mkdir -p "${FOLDER}" && unzip -j -o -qq "etcher.zip" -d "${FOLDER}"
    rm "etcher.zip"

    mv "$FOLDER"/*.AppImage "${FOLDER}/Etcher.AppImage"
  fi
)
