#!/bin/bash

# extract parameters and files
cpd_args=""
rm -f /tmp/list
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} =~ ^[\ ]*--?[^=]+ ]]; then
      cpd_args="$cpd_args ${!i}"
    else
      echo "${!i}" >> /tmp/list
    fi
done

# add default minimum tokens if not specified
if [[ ! $cpd_args == *"--minimum-tokens="* ]]; then
  cpd_args="$cpd_args --minimum-tokens=100"
fi

# add default language if not specified
if [[ ! $cpd_args == *"--language="* && ! $cpd_args == *"-l="* ]]; then
  cpd_args="$cpd_args --language=java"
fi

# shellcheck disable=SC2086
/opt/pmd/bin/pmd cpd --format=text $cpd_args --file-list=/tmp/list
