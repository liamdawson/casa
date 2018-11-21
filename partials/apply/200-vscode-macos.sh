#!/usr/bin/env bash

(
  set -e
  set -u

  # non-macos installs need to be as admin
  _not_macos exit 0

  DOWNLOAD_URL="https://go.microsoft.com/fwlink/?LinkID=620882"

  curl -sSL -o vscode.zip "$DOWNLOAD_URL" && unzip -o -qq vscode.zip -d "/Applications" && rm vscode.zip
)
