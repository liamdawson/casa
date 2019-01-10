export GPG_TTY="$(tty)"

# bypass default macos ssh agent
_macos_only export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
