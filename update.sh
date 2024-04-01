#!/bin/bash

set -e

pmd_current=$(curl --silent https://api.github.com/repos/pmd/pmd/releases/latest | jq '.assets[] | select(.name | contains("pmd-dist-") and contains("-bin.zip")) | .browser_download_url' | sed -e 's/^"//' -e 's/"$//')
sed -i -e "s|PMD_RELEASE=.*|PMD_RELEASE=\"$pmd_current\"|g" install.sh

checkstyle_current=$(curl --silent https://api.github.com/repos/checkstyle/checkstyle/releases/latest | jq '.assets[] | select(.name | contains("checkstyle-") and contains(".jar")) | .browser_download_url' | sed -e 's/^"//' -e 's/"$//')
sed -i -e "s|CHECKSTYLE_RELEASE=.*|CHECKSTYLE_RELEASE=\"$checkstyle_current\"|g" install.sh
