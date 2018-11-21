#!/usr/bin/env bash

(
  set -e
  set -u

  if ! command-exists aws-vault
  then
    go get github.com/99designs/aws-vault
  fi
)
