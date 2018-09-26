#!/usr/bin/env bash

(
  set -e
  set -u

  _not_linux exit 0
  command -v apt >/dev/null 2>&1 || exit 0

  apt install -y \
  latte-dock \
kcolorchooser \
chromium-browser \
konversation \
wine-devel \
winehq-devel \
winetricks \
git \
vim \
curl \
stow \
libnotify-bin \
zsh \
zsh-doc \
gnupg2 \
scdaemon \
pinentry-curses \
pinentry-qt \
apt-transport-https \
ca-certificates \
software-properties-common \
gnome-keyring \
desktop-file-utils \
openjdk-11-jdk \
openjdk-11-jre \
autoconf \
bison \
build-essential \
clang \
make \
libc++-dev \
libssl-dev \
libyaml-dev \
libreadline-dev \
libreadline6-dev \
zlib1g-dev \
libevent-dev \
libncurses5-dev \
libffi-dev \
libgdbm5 \
libgdbm-dev \
libsqlite3-dev \
libbz2-dev \
g++ \
gcc \
libc6-dev \
libffi-dev \
libgmp-dev \
xz-utils \
zlib1g-dev \
cmake \
libfreetype6-dev \
libfontconfig1-dev \
xclip

)