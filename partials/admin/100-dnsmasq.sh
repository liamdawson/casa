#!/usr/bin/env bash

(
  set -e
  set -u

  # oh how the turn tables
  # TODO: linux

  _not_macos exit 0

  function macos_enable() {
    brew services start dnsmasq

    if [[ ! -f "/etc/resolver/test" ]]
    then
      [[ -d "/etc/resolver" ]] || mkdir "/etc/resolver"
      echo 'nameserver 127.0.0.1' > "/etc/resolver/test"
    fi
  }
)
