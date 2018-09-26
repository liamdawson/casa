if [[ ! -d "${NODENV_ROOT}" ]]
then
  git clone https://github.com/nodenv/nodenv.git "${NODENV_ROOT}"
  git clone https://github.com/nodenv/node-build.git "${NODENV_ROOT}/plugins/node-build"
  git clone https://github.com/nodenv/nodenv-update.git "${NODENV_ROOT}/plugins/nodenv-update"
  git clone https://github.com/nodenv/nodenv-default-packages.git "${NODENV_ROOT}/plugins/nodenv-default-packages"
fi

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
