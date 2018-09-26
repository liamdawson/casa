(
  if ! which 'casa-update' >/dev/null 2>&1
  then
    cat << EOF > "${USER_BINARIES_HOME}/casa-update"
#!/bin/bash
(
  cd ${SCRIPT_DIR}
  echo 'updating...'
  git pull
)
EOF
  chmod +x "${USER_BINARIES_HOME}/casa-update"
  fi
)
