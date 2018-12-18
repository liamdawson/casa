#!/usr/bin/env bash

(
  set -e
  set -u

  function install_plugin() {
    [[ -d "${NODENV_ROOT}/plugins" ]] || mkdir "${NODENV_ROOT}/plugins"

    pushd "${NODENV_ROOT}/plugins"

    if [[ ! -d "$2" ]]
    then
      git clone "$1" "$2"
    fi

    popd
  }

  if [[ ! -d "${NODENV_ROOT}" ]]
  then
    git clone https://github.com/nodenv/nodenv.git "${NODENV_ROOT}"
  fi

  install_plugin https://github.com/nodenv/node-build.git "node-build"
  install_plugin https://github.com/nodenv/nodenv-update.git "nodenv-update"
  install_plugin https://github.com/nodenv/nodenv-default-packages.git "nodenv-default-packages"
  install_plugin https://github.com/nodenv/nodenv-package-rehash.git "nodenv-package-rehash"

  nodenv package-hooks install --all

  cat << EOF > "${NODENV_ROOT}/default-packages"
npm
yarn
eslint
tslint
typescript
gulp
webpack
emoj
EOF

  echo '8.12.0' > "${NODENV_ROOT}/version"
  nodenv install -s "$(cat ${NODENV_ROOT}/version)"
)
