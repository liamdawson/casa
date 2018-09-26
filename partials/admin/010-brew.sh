#!/usr/bin/env bash

(
  set -e
  set -u
 
  _not_macos exit 0

  if ! command -v brew >/dev/null 2>&1
  then
    # echo tells homebrew installer we're not interactive
    echo | sudo -u "$LOGNAME" /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  sudo -u "$LOGNAME" brew install stow
)

