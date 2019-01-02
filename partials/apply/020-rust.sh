#!/usr/bin/env bash

if ! command -v rustup >/dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi

# IntelliJ rust expects (some of?) these directories
[[ -r "${HOME}/.cargo" ]] || ln -s "${XDG_DATA_HOME}/cargo" "${HOME}/.cargo"
[[ -r "${HOME}/.rustup" ]] || ln -s "${XDG_DATA_HOME}/rustup" "${HOME}/.rustup"
[[ -r "${HOME}/.multirust" ]] || ln -s "${XDG_DATA_HOME}/rustup" "${HOME}/.multirust"

# expected components
rustup component list | grep -q 'rust-src.*\(installed\)' || rustup component add rust-src
rustup component list | grep -q 'clippy.*\(installed\)' || rustup component add clippy
rustup component list | grep -q 'rustfmt.*\(installed\)' || rustup component add rustfmt
rustup component list | grep -q 'rls.*\(installed\)' || rustup component add rls
