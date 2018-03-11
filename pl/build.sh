#!/usr/bin/env bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied. You must supply a database host"
    exit 1
fi


HOST=$1

# Find all files for the pipeline, ignoring folders and files we do not want to execute
find .  ! -name '*.md' ! -name 'build.sh' ! -name '*LICENSE' ! -path '*.git*'  ! -path '*01_setup*' ! -path '*_l0*' -type f  | sort -h |
while read filename
do
    echo ""
    echo "-----------------------------------------------------------------------------"
    echo "Processing: $filename"    # ... or any other command using $filename
    
    # Extract the extension so we can decide what to do
    filename_only=$(basename "${filename}")
    fileext=${filename_only##*.}
    echo "Extension: ${fileext}"
    
    # if the file is sql, then use psql tool
    if [ "${fileext}" = "sql" ]
    then
        psql -h $HOST -d proj001_lfb -U postgres -w -f "$filename"
    
    # if the file is a sheel script then use bash
    elif [ "${fileext}" = "sh" ]
    then
    
        bash "$filename"
    else
        echo "Skipping file with extension '${fileext}' "
    
    fi
    
done

echo "Finished build script"