#!/bin/bash

# find the index of the first parameter with a Java file path
idx=1
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} == *.java ]]; then
        idx=${i}
        break
    fi
done

# add default ruleset if not specified
pc_args="${*:1:idx-1}"
if [[ ! $pc_args == *"-R "* ]]; then
  pc_args="$pc_args -R /opt/ruleset.xml"
fi

# populate list of files to analise
files="${*:idx}"
eol=$'\n'
echo "${files// /$eol}" > /tmp/list

# shellcheck disable=SC2086
/opt/pmd/bin/run.sh pmd -f textcolor -language java --file-list /tmp/list $pc_args
