#!/usr/bin/env bash

_CANDIDATE_DIRECTORIES=(
  "${XDG_DATA_HOME}/vscode/bin"
)

for dir in "${_CANDIDATE_DIRECTORIES[@]}"
do
  [[ ! -d "$dir" ]] || export PATH="${dir}:${PATH}"
done

unset _CANDIDATE_DIRECTORIES
