#!/bin/bash

set -e

if ! git diff-index --quiet HEAD; then
  git config --global user.name 'Gherynos'
  git config --global user.email 'gherynos@users.noreply.github.com'
  git commit -am "patch: update tools versions"
  git push

  version=$(git describe --abbrev=0 --tags)
  new_version=$(perl -pe 's/(\d+)(?!.*\d+)/$1+1/e' <<< "$version")
  echo "$version -> $new_version"
  git tag "temp"

  git push --tags
fi
