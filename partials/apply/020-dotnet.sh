#!/usr/bin/env bash
(
  set -e
  set -u

  if [[ ! -d "${DOTNETCORE_ROOT}" ]]
  then
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -NoPath -InstallDir "${DOTNETCORE_ROOT}"
  fi

  function _install_tool() {
    if ! command-exists $1
      dotnet tool install --global $1
    fi
  }

  _install_tool dotnet-outdated
)
