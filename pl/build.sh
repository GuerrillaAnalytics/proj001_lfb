#!/usr/bin/env bash

HOST=$1

# Find all files for the pipeline, ignoring folders and files we do not want to execute
find .  ! -name '*.md' ! -name 'build.sh' ! -name '*LICENSE' ! -path '*.git*'  ! -path '*01_setup*' ! -path '*_l0*' -type f  | sort -h |
while read filename
do
    echo ""
    echo "Processing: $filename"    # ... or any other command using $filename
    psql -h $HOST -d proj001_lfb -U postgres -w -f "$filename"
done