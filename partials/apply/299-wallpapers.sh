#!/usr/bin/env bash

(
  set -e
  set -u

  PAPERS=( raids-final.png )

  mkdir -p "${HOME}/Pictures/wallpapers/" || true
  cd "${HOME}/Pictures/wallpapers/"

  for paper in "${PAPERS[@]}"
  do
    if [[ ! -r "${paper}" ]]
    then
      curl -o "${paper}" -sSL "https://s3-ap-southeast-2.amazonaws.com/ldaws-personal-assets/wallpapers/${paper}"
    fi
  done
)
