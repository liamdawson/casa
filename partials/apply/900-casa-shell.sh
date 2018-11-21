(
  if ! which 'casa-shell' >/dev/null 2>&1
  then
    cat << EOF > "${USER_BINARIES_HOME}/casa-shell"
#!/bin/bash
(
  cd ${SCRIPT_DIR}
  \$SHELL
)
EOF
  chmod +x "${USER_BINARIES_HOME}/casa-shell"
  fi
)
