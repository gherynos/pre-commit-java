#!/bin/bash

set -e

PMD_VERSION=6.55.0
CHECKSTYLE_VERSION=10.9.1

apt-get update && apt-get install --no-install-recommends -y ca-certificates wget unzip curl bash jq

cd /opt

wget -nc -O pmd.zip "https://github.com/pmd/pmd/releases/download/pmd_releases%2F$PMD_VERSION/pmd-bin-$PMD_VERSION.zip" \
  && unzip pmd.zip \
  && rm pmd.zip \
  && mv pmd-bin* pmd \
  && chmod -R +x pmd

wget -nc -O checkstyle.jar "https://github.com/checkstyle/checkstyle/releases/download/checkstyle-$CHECKSTYLE_VERSION/checkstyle-$CHECKSTYLE_VERSION-all.jar"
