#!/usr/bin/env bash
(
  set -e
  set -u

  # set up common configuration
  [[ -d "${HOME}/.sh.d" ]] || ln -s "${SCRIPT_DIR}/sh.d/" "${HOME}/.sh.d"

  ## unstow config
  stow -R -d "${SCRIPT_DIR}/config" -t "$HOME" --no-folding all
  ## unstow nix config
  _linux_only stow -R -d "${SCRIPT_DIR}/config" -t "$HOME" --no-folding nix
  _macos_only stow -R -d "${SCRIPT_DIR}/config" -t "$HOME" --no-folding nix
  ## unstow macos config
  _macos_only stow -R -d "${SCRIPT_DIR}/config" -t "$HOME" --no-folding macos
  ## unstow linux config
  _linux_only stow -R -d "${SCRIPT_DIR}/config" -t "$HOME" --no-folding linux
  ## unstow app entries
  [[ -d "${XDG_DATA_HOME}/applications" ]] || mkdir -p "${XDG_DATA_HOME}/applications"
  stow -R -d "${SCRIPT_DIR}/files" -t "${XDG_DATA_HOME}/applications" --no-folding app-entries
)

set +e
set +u
for file in "${HOME}/.sh.d"/*.sh
do
  . "$file"
done
set -e
set -u
