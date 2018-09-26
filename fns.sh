#!/usr/bin/env bash

# https://apple.stackexchange.com/a/311511
function _install_remote_dmg {
  set -x
  tempd=$(mktemp -d)
  curl -sSL $1 > $tempd/pkg.dmg
  listing=$(hdiutil attach $tempd/pkg.dmg | grep Volumes)
  volume=$(echo "$listing" | cut -f 3)
  if [ -e "$volume"/*.app ]; then
    cp -rf "$volume"/*.app /Applications
  elif [ -e "$volume"/*.pkg ]; then
    package=$(ls -1 | grep *.pkg | head -1)
    installer -pkg "$volume"/"$package".pkg -target /
  fi
  device="$(echo "$listing" | cut -f 1)"
  hdiutil detach $device
  rm -rf $tempd
  set +x
}