#!/usr/bin/env bash

(
  set -e
  set -u

  _not_macos exit 0

  brew bundle --file="${SCRIPT_DIR}/config/macos/Brewfile"
)
