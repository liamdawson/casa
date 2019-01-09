#!/usr/bin/env bash

(
  set -e
  set -u

  _not_linux exit 0

  if ! command -v snap >/dev/null 2>&1
  then
    apt install -y snapd
  fi
)
