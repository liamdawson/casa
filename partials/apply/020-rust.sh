if ! which rustup >/dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi
