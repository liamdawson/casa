#!/bin/bash

if ! which docker-compose >/dev/null 2>&1
then
  # TODO: ensure macOS
  curl -sSL "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o "${USER_BINARIES_HOME}/docker-compose"
  chmod +x "${USER_BINARIES_HOME}/docker-compose"
fi
