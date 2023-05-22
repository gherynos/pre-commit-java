#!/bin/bash

set -e

git update-index -q --refresh
if ! git diff-index --exit-code --ignore-submodules HEAD; then
  git config --global user.name 'github-actions[bot]'
  git config --global user.email '41898282+github-actions[bot]@users.noreply.github.com'
  git commit -am "patch: update tools versions"
  git push

  version=$(git describe --abbrev=0 --tags)
  new_version=$(perl -pe 's/(\d+)(?!.*\d+)/$1+1/e' <<< "$version")
  echo "$version -> $new_version"
  git tag "$new_version"

  git push --tags
fi
