#!/bin/bash

set -e

pmd_current=$(curl --silent https://api.github.com/repos/pmd/pmd/releases/latest | jq -r '.assets[] | select(.name | test("pmd-dist-.+-bin.zip$")) | .browser_download_url')
sed -i -e "s|PMD_RELEASE=.*|PMD_RELEASE=\"$pmd_current\"|g" install.sh

checkstyle_current=$(curl --silent https://api.github.com/repos/checkstyle/checkstyle/releases/latest | jq -r '.assets[] | select(.name | test("checkstyle-.+.jar$")) | .browser_download_url')
sed -i -e "s|CHECKSTYLE_RELEASE=.*|CHECKSTYLE_RELEASE=\"$checkstyle_current\"|g" install.sh
