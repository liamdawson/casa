#!/usr/bin/env bash

(
  set -e
  set -u

if [[ ! -d "${PYENV_ROOT}" ]]
then
  git clone https://github.com/pyenv/pyenv.git "${PYENV_ROOT}"
  git clone https://github.com/pyenv/pyenv-update.git "${PYENV_ROOT}/plugins/pyenv-update"
  git clone https://github.com/jawshooah/pyenv-default-packages.git "${PYENV_ROOT}/plugins/pyenv-default-packages" 
fi

cat << EOF > "${PYENV_ROOT}/default-packages"
pip
pipsi; python_version > '3.3'
awscli; python_version > '3.3'
EOF

echo '3.7.1 2.7.15' > "${PYENV_ROOT}/version"

# pyenv supports activating multiple versions at once
# but not installing multiple at once
for version in $(cat "${PYENV_ROOT}/version")
do
  if command -v brew >/dev/null 2>&1
  then
    LIBRARY_PATH="${LIBRARY_PATH:-}:$(brew --prefix openssl)/lib" \
    pyenv install -s "$version"
  else
    pyenv install -s "$version"
  fi
done
)
