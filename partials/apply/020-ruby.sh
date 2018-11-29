if [[ ! -d "${RBENV_ROOT}" ]]
then
  git clone https://github.com/rbenv/rbenv.git "${RBENV_ROOT}"
  git clone https://github.com/rbenv/ruby-build.git "${RBENV_ROOT}/plugins/ruby-build"
  git clone https://github.com/rkh/rbenv-update.git "${RBENV_ROOT}/plugins/rbenv-update"
  git clone https://github.com/rbenv/rbenv-default-gems.git "${RBENV_ROOT}/plugins/rbenv-default-gems"
fi

cat << EOF > "${RBENV_ROOT}/default-gems"
pry
bundler
bundler-audit
license_finder
foreman
lolcat
solargraph
rubocop
EOF

echo '2.5.3' > "${RBENV_ROOT}/version"
rbenv install -s "$(cat ${RBENV_ROOT}/version)"
