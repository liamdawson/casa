(
  if ! which shellcheck >/dev/null 2>&1
  then
    stack update
    stack install ShellCheck
  fi
)