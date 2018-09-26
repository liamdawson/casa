if [[ ! -d "${GOENV_ROOT}" ]]
then
  git clone https://github.com/syndbg/goenv.git "${GOENV_ROOT}"
fi
