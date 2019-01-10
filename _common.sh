#!/usr/bin/env bash

function command-exists() {
  command -v $1 >/dev/null 2>&1
}

function apt-ensure() {
  ! command-exists apt || apt install "$@"
}
