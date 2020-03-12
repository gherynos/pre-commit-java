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
echo "${files// /,}" >> /tmp/list

/opt/pmd/bin/run.sh pmd -f textcolor -language java $pc_args -filelist /tmp/list
