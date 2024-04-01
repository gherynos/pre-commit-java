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

# populate list of files to analise
files="${*:idx}"
eol=$'\n'
echo "${files// /$eol}" > /tmp/list

# shellcheck disable=SC2086
/opt/pmd/bin/pmd cpd --format text --language java $cpd_args --file-list /tmp/list
