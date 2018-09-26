#!/bin/sh

[ ! -d "${HOME}/bin" ] || export PATH="$PATH:${HOME}/bin"

if command -v systemd-path >/dev/null 2>&1 
then
  export PATH="${PATH}:$(systemd-path user-binaries)"
else
  [ ! -d "${HOME}/.local/bin" ] || export PATH="$PATH:${HOME}/.local/bin"
fi

[ ! -d "/var/lib/snapd/desktop" ] || export XDG_DATA_DIRS="${XDG_DATA_DIRS:-}:/var/lib/snapd/desktop"
