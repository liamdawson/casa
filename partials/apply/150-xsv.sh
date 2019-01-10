(
  _VERSION="0.13.0"

  if ! which xsv >/dev/null 2>&1
  then
    _macos_only curl -o xsv.tar.gz -sSL https://github.com/BurntSushi/xsv/releases/download/"$_VERSION"/xsv-"$_VERSION"-x86_64-apple-darwin.tar.gz
    _linux_only curl -o xsv.tar.gz -sSL https://github.com/BurntSushi/xsv/releases/download/"$_VERSION"/xsv-"$_VERSION"-x86_64-unknown-linux-musl.tar.gz

    tar -xzf xsv.tar.gz --directory "${USER_BINARIES_HOME}"

    rm xsv.tar.gz
  fi
)
