#!/usr/bin/env bash

(
  set -e
  set -u

  _not_macos exit 0
  
  ETC_HOME="$(brew --prefix)/etc/"

  [[ -d "$ETC_HOME" ]] || mkdir -p "$ETC_HOME"

  [[ ! -r "$ETC_HOME/dnsmasq.conf" ]] || rm "$ETC_HOME/dnsmasq.conf"

  ln -s "${SCRIPT_DIR}/files/dnsmasq.conf" "$ETC_HOME/dnsmasq.conf"
)
