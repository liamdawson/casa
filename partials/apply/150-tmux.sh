#!/usr/bin/env bash

(
  TMUX_DIR="${XDG_DATA_HOME}/src/tmux"
  TMUX_TARGET="${USER_BINARIES_HOME}/tmux"
  TMUX_VERSION="2.8"

  set -e
  set -u

  if [[ ! -r "$TMUX_TARGET" ]]
  then
    if [[ ! -d "$TMUX_DIR" ]]
    then
      git clone "https://github.com/tmux/tmux.git" "$TMUX_DIR"
    fi

    cd "$TMUX_DIR"
    git checkout "$TMUX_VERSION"

    sh autogen.sh
    ./configure && make

    cp tmux "$TMUX_TARGET"
  fi
)