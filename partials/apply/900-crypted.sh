(
  if ! which 'crypted' >/dev/null 2>&1
  then
    cat << 'EOF' > "${USER_BINARIES_HOME}/crypted"
#!/bin/bash
(
  set -e
  set -u

  if [[ $# -lt 2 ]] || [[ $1 = "--help" ]] || [[ $1 = "-h" ]] || [[ $1 = "/?" ]]
  then
    echo 'edit a GPG encrypted file using $EDITOR, encrypted for the provided key'
    echo "usage: $0 key file"
    exit 1
  fi

  TARGET_KEY="$1"
  TARGET_FILE="$2"

  TMP_FILE="$(mktemp --tmpdir 'crypted.tmp.XXXXXXXXXX')"

  [[ ! -f "$TARGET_FILE" ]] || gpg --decrypt "$TARGET_FILE" > "$TMP_FILE"

  ${EDITOR:-/usr/bin/editor} "$TMP_FILE" || (rm "$TMP_FILE" && echo 'editor exited with failure' && exit 2)

  gpg -e -r "$TARGET_KEY" -o - "$TMP_FILE" > "$TARGET_FILE" 2>/dev/null
  rm "$TMP_FILE"
)
EOF
  chmod +x "${USER_BINARIES_HOME}/crypted"
  fi
)
