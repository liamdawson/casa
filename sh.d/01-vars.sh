#!/usr/bin/env bash

export EDITOR="vim"
export VISUAL="code --wait"

case "$(uname -s)" in
  Darwin) export _HOST_ID="macos";;
  Linux) export _HOST_ID="linux";;
  CYGWIN*|MINGW32*|MSYS*) export _HOST_ID="windows";;
  *) export _HOST_ID="unknown";;
esac

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
# TODO: macos support
if command -v systemd-path >/dev/null 2>&1
then
  export USER_BINARIES_HOME="$(systemd-path user-binaries)"
else
  export USER_BINARIES_HOME="${HOME}/.local/bin"
fi

[[ -d "/usr/local/bin" ]] && export PATH="/usr/local/bin:${PATH}"
[[ -d "/usr/local/sbin" ]] && export PATH="/usr/local/sbin:${PATH}"
if [[ -d "/private/etc/paths.d/" ]]
then
  for file in /private/etc/paths.d/*
  do
    export PATH="$(cat $file):$PATH"
  done
fi

export DOTNET_ROOT="${XDG_DATA_HOME}/dotnet"
export DOTNETCORE_ROOT="${DOTNET_ROOT}"
# TODO: is this second one used?
export PATH="$PATH:${DOTNETCORE_ROOT}:${HOME}/.dotnet/tools"

export GOENV_ROOT="${XDG_DATA_HOME}/goenv"
[[ ! -z "${GOPATH:-}" ]] || export GOPATH="${HOME}/go"
export PATH="$PATH:${GOPATH}/bin:${GOENV_ROOT}/bin"

export NODENV_ROOT="${XDG_DATA_HOME}/nodenv"
export PATH="$PATH:${NODENV_ROOT}/bin"

export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
export PATH="$PATH:${PYENV_ROOT}/bin"

export RBENV_ROOT="${XDG_DATA_HOME}/rbenv"
export PATH="$PATH:${RBENV_ROOT}/bin"

export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export PATH="$PATH:${CARGO_HOME}/bin"

# macos Android SDK tools
if [[ -d "${HOME}/Library/Android/sdk/platform-tools" ]]
then
  export PATH="${PATH}:${HOME}/Library/Android/sdk/platform-tools"
fi
