#!/usr/bin/env bash

(
  set -e
  set -u

  function linux_install() {
  ## install Jetbrains toolbox, if it's missing
  if [[ ! -d "${XDG_DATA_HOME}/JetBrains" ]]
  then
    curl -sSL 'https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.tar.gz' | tar -xz --strip-components=1 --directory="${XDG_DATA_HOME}"
    "${XDG_DATA_HOME}/jetbrains-toolbox"
  fi
  }

  function macos_install() {
    DOWNLOAD_URL="https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.11.4269.dmg"
    [[ -r "/Applications/JetBrains Toolbox.app" ]] || _install_remote_dmg "$DOWNLOAD_URL"
  }

  _linux_only linux_install
  _macos_only macos_install
)
