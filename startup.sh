#!/usr/bin/env bash

set -euo pipefail

REPO_URL=${REPO_URL-http://mirror.yandex.ru/altlinux/Sisyphus}
ARCH=${ARCH-x86_64}

cat >apt.conf <<EOF
Dir::Etc::main "/dev/null";
Dir::Etc::parts "/var/empty";
Dir::Etc::SourceParts "/var/empty";

Dir::Etc::SourceList    "$PWD/sources.list";
EOF

cat >sources.list <<EOF
rpm $REPO_URL $ARCH classic
rpm $REPO_URL noarch classic
EOF

mkdir box
mkaptbox --apt-config=$PWD/apt.conf box
box/aptbox/apt-get install -qq --print-uris -y ${PKG_LIST} | cut -d' ' -f1
