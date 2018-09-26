#!/usr/bin/env bash

(
  set -e
  set -u

  function linux_install() {
  if [[ ! -d "${XDG_DATA_HOME}/Telegram" ]]
  then
    curl -sSL https://telegram.org/dl/desktop/linux | tar -xJ --directory "${XDG_DATA_HOME}"
  fi
  }

  function macos_install() {
    [[ -r "/Applications/Telegram.app" ]] || _install_remote_dmg "https://telegram.org/dl/desktop/mac"
  }

  _linux_only linux_install
  _macos_only macos_install
)