if [[ ! -d "${DOTNETCORE_ROOT}" ]]
then
  curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin -NoPath -InstallDir "${DOTNETCORE_ROOT}"
fi
