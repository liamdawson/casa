#!/bin/bash

(
  if ! command -v 'casa-apply' >/dev/null 2>&1
  then
    cat << EOF > "${USER_BINARIES_HOME}/casa-apply"
#!/bin/bash
(
  cd ${SCRIPT_DIR}
  echo 'applying...'
  bash apply
)
EOF
  chmod +x "${USER_BINARIES_HOME}/casa-apply"
  fi
)
