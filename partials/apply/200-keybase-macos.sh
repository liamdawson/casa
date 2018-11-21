#!/usr/bin/env bash

(
  set -e
  set -u

  # non-macos installs need to be as admin
  _not_macos exit 0

  [[ -r "/Applications/Keybase.app" ]] || _install_remote_dmg "https://prerelease.keybase.io/Keybase.dmg"
)
