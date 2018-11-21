(
  set -e
  set -u

  _not_linux exit 0
  command -v apt >/dev/null 2>&1 || exit 0

  apt update -y
  apt upgrade -y
)