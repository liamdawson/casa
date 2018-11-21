(
_not_linux exit 0

POSTMAN_HOME="${XDG_DATA_HOME}/Postman/"
# TODO: macOS
POSTMAN_URL="https://dl.pstmn.io/download/latest/linux64"

if [[ ! -d "$POSTMAN_HOME" ]]
then
  mkdir -p "$POSTMAN_HOME"
  curl -sSL "$POSTMAN_URL" | tar -xz --directory="$POSTMAN_HOME" --strip-components=1
fi
)