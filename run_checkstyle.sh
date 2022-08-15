#!/bin/bash

# find the index of the first parameter with a Java file path
idx=1
for (( i=1; i <= "$#"; i++ )); do
    if [[ ${!i} == *.java ]]; then
        idx=${i}
        break
    fi
done

# add default configuration if not specified
cs_args="${*:1:idx-1}"
if [[ ! $cs_args == *"-c "* ]]; then
  cs_args="$cs_args -c /opt/adjusted_google_checks.xml"
fi

files="${*:idx}"
java -jar /opt/checkstyle.jar $cs_args $files
