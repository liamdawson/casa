#!/usr/bin/env bash
(
  set -e
  set -u

  if [[ ! -d "${DOTNETCORE_ROOT}" ]]
  then
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -NoPath -InstallDir "${DOTNETCORE_ROOT}"
  fi

  function _install_or_update() {
    if command-exists $1
    then
      dotnet tool update --global $1
    else
      dotnet tool install --global $1
    fi
  }

  _install_or_update dotnet-outdated
)
