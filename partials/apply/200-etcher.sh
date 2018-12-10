#!/usr/bin/env

(
  set -e
  set -u

  _windows_only exit 0


  function install_linux() {
  if [[ ! -d "${FOLDER}" ]]
  then
    FOLDER="${XDG_DATA_HOME}/Etcher"
    DOWNLOAD_URL="https://github.com/balena-io/etcher/releases/download/v1.4.6/etcher-electron-1.4.6-linux-x64.zip"
    curl -sSL "$DOWNLOAD_URL" -o "etcher.zip" && mkdir -p "${FOLDER}" && unzip -j -o -qq "etcher.zip" -d "${FOLDER}"
    rm "etcher.zip"

    mv "$FOLDER"/*.AppImage "${FOLDER}/Etcher.AppImage"
  fi
  }

  function install_macos() {
    [[ -d "/Applications/Etcher.app" ]] || _install_remote_dmg "https://github.com/balena-io/etcher/releases/download/v1.4.8/balenaEtcher-1.4.8.dmg"
  }

  _macos_only install_macos
  _linux_only install_linux
)
