#!/usr/bin/env bash

(
  set -e
  set -u

  _not_linux exit 0

  # KDE backports

  if [[ ! -f "/etc/apt/sources.list.d/kubuntu-ppa-ubuntu-backports-bionic.list" ]]
  then
    add-apt-repository -y ppa:kubuntu-ppa/backports
  fi
)