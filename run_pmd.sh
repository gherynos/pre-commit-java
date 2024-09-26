#!/bin/bash

# extract parameters and files
pc_args=""
rm -f /tmp/list
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} =~ ^[\ ]*--?[^=]+ ]]; then
      pc_args="$pc_args ${!i}"
    else
      echo "${!i}" >> /tmp/list
    fi
done

# add default version if not specified
if [[ ! $pc_args == *"--use-version="* ]]; then
  pc_args="$pc_args --use-version=java-17"
fi

# add default format if not specified
if [[ ! $pc_args == *"-f="* && ! $pc_args == *"--format="* ]]; then
  pc_args="$pc_args -f=textcolor"
fi

# add default ruleset if not specified
if [[ ! $pc_args == *"-R="* && ! $pc_args == *"--rulesets="* ]]; then
  pc_args="$pc_args -R=/opt/ruleset.xml"
fi

# shellcheck disable=SC2086
/opt/pmd/bin/pmd check --no-progress --file-list=/tmp/list $pc_args
