#!/usr/bin/env bash

(
  set -e
  set -u

  function linux_install() {
FIREFOX_URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
FIREFOX_DESTINATION="${XDG_DATA_HOME}/mozilla/firefox-developer-edition"

if [[ ! -d "$FIREFOX_DESTINATION" ]]
then
  mkdir -p "$FIREFOX_DESTINATION"
  curl -sSL "$FIREFOX_URL" | tar -xj --directory "$FIREFOX_DESTINATION" --strip-components=1
fi
  }

  function macos_install() {
    FIREFOX_URL="https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=osx&lang=en-US"
    FIREFOX_DESTINATION="/Applications/Firefox Developer Edition.app"

    [[ -r "$FIREFOX_DESTINATION" ]] || _install_remote_dmg "$FIREFOX_URL"
  }

  _linux_only linux_install
  _macos_only macos_install
)



