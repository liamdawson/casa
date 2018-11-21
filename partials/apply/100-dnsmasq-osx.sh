#!/usr/bin/env bash

(
  set -e
  set -u

  ETC_HOME="$(brew --prefix)/etc/"

  [[ -d "$ETC_HOME" ]] || mkdir -p "$ETC_HOME"

  [[ ! -r "$ETC_HOME/dnsmasq.conf" ]] || rm "$ETC_HOME/dnsmasq.conf"

  ln -s "${SCRIPT_DIR}/files/dnsmasq.conf" "$ETC_HOME/dnsmasq.conf"
)
