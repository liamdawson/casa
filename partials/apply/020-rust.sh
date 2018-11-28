if ! which rustup >/dev/null 2>&1; then
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi

# IntelliJ rust expects (some of?) these directories
[[ -r "${HOME}/.cargo" ]] || ln -s "${XDG_DATA_HOME}/cargo" "${HOME}/.cargo"
[[ -r "${HOME}/.rustup" ]] || ln -s "${XDG_DATA_HOME}/rustup" "${HOME}/.rustup"
[[ -r "${HOME}/.multirust" ]] || ln -s "${XDG_DATA_HOME}/rustup" "${HOME}/.multirust"

