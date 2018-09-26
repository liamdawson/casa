#!/bin/bash

PACKAGES="cargo-update \
cargo-watch \
xsv \
ripgrep \
"

for package in $PACKAGES; do
  cargo install "$package" || [[ $? -eq 101 ]]
done

cargo install-update -a
