#!/usr/bin/env bash

(
  set -e
  set -u
 
  _not_macos exit 0

  defaults write -g com.apple.mouse.scaling 3
  defaults write -g ApplePressAndHoldEnabled 0
)
