(
  if ! which rg >/dev/null 2>&1
  then
    _linux_only curl -o rg.tar.gz -sSL https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-unknown-linux-musl.tar.gz
    _macos_only curl -o rg.tar.gz -sSL https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep-0.10.0-x86_64-apple-darwin.tar.gz

    TAR_COMMAND="gtar"
    command -v gtar >/dev/null 2>&1 || TAR_COMMAND="tar"
    "$TAR_COMMAND" -xzf rg.tar.gz --strip-components=1 --directory "${USER_BINARIES_HOME}" --wildcards '*/rg'

    rm rg.tar.gz
  fi
)
