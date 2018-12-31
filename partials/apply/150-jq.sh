#!/usr/bin/env bash

(
  set -e
  set -u

  if ! command-exists jq
  then
    _linux_only curl -o "${USER_BINARIES_HOME}/jq" -sSL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
    _macos_only curl -o "${USER_BINARIES_HOME}/jq" -sSL https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64

    chmod +x "${USER_BINARIES_HOME}/jq"
  fi
)
