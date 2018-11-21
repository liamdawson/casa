(
  set -e
  set -u

  _not_linux exit 0

  command -v dpkg >/dev/null 2>/dev/null || exit 0

      # wine
  sudo dpkg --add-architecture i386

  NEW_WINE_INSTALL=""
  if ! grep -q -e 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' /etc/apt/sources.list
  then
    wget -nc https://dl.winehq.org/wine-builds/Release.key
    sudo apt-key add Release.key
    rm Release.key
    sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
    sudo apt update

    NEW_WINE_INSTALL="Y"
  fi
)