#!/bin/bash

# find the index of the first parameter with a Java file path
idx=1
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} == *.java ]]; then
        idx=${i}
        break
    fi
done

# add default minimum tokens if not specified
cpd_args="${*:1:idx-1}"
if [[ ! $cpd_args == *"--minimum-tokens "* ]]; then
  cpd_args="$cpd_args --minimum-tokens 100"
fi

files="${*:idx}"

# shellcheck disable=SC2086
/opt/pmd/bin/run.sh cpd --format text --language java $cpd_args --files $files
