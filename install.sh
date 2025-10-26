#!/bin/bash

set -e

PMD_RELEASE="https://github.com/pmd/pmd/releases/download/pmd_releases/7.17.0/pmd-dist-7.17.0-bin.zip"
CHECKSTYLE_RELEASE="https://github.com/checkstyle/checkstyle/releases/download/checkstyle-12.1.0/checkstyle-12.1.0-all.jar"

apt-get update && apt-get install --no-install-recommends -y ca-certificates wget unzip curl bash jq

cd /opt

wget -nc -O pmd.zip "$PMD_RELEASE" \
  && unzip pmd.zip \
  && rm pmd.zip \
  && mv pmd-bin* pmd \
  && chmod -R +x pmd

wget -nc -O checkstyle.jar "$CHECKSTYLE_RELEASE"
