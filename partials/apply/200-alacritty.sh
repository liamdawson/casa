#!/bin/bash

ALACRITTY_DIR="${XDG_DATA_HOME}/src/alacritty"
ALACRITTY_TARGET="${USER_BINARIES_HOME}/alacritty"

(
  set -e
  set -u

  if [[ ! -r "${ALACRITTY_TARGET}" ]]
  then
    if [[ ! -d "${ALACRITTY_DIR}" ]]
    then
      mkdir -p "${ALACRITTY_DIR}"
      git clone https://github.com/jwilm/alacritty.git "${ALACRITTY_DIR}"
    fi

    cd "${ALACRITTY_DIR}"

    rustup override set stable
    rustup update stable
    cargo build --release

    cp target/release/alacritty "${USER_BINARIES_HOME}/alacritty"

    if command -v desktop-file-install >/dev/null 2>&1
    then
      desktop-file-install alacritty.desktop --dir="${XDG_DATA_HOME}/applications"
    fi
  fi

  function macos_app_bundle() {
    cd "${ALACRITTY_DIR}"
    make app
    cp -r "${ALACRITTY_DIR}/target/release/osx/Alacritty.app" "/Applications"
  }

  [[ -r "/Applications/Alacritty.app" ]] || _macos_only macos_app_bundle
)
