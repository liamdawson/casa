#!/usr/bin/env bash

(
  set -e
  set -u

  if ! command-exists convox
  then
    _macos_only curl -L https://convox.com/cli/osx/convox -o "${USER_BINARIES_HOME}/convox"
    _linux_only curl -L https://convox.com/cli/linux/convox -o "${USER_BINARIES_HOME}/convox"
    _windows_only curl -L https://convox.com/cli/windows/convox -o "${USER_BINARIES_HOME}/convox"

    _not_windows chmod 755 "${USER_BINARIES_HOME}/convox"
  fi
)
