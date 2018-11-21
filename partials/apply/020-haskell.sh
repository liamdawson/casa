# TODO: no systemd path on macos
(
  if ! which stack >/dev/null 2>&1 && ! [[ -r "${USER_BINARIES_HOME}/stack" ]]
  then
    curl -sSL https://get.haskellstack.org/ | sh /dev/stdin -d "$USER_BINARIES_HOME"
  fi
)
