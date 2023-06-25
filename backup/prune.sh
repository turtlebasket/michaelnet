#!/usr/bin/bash

# Prunes container data folders monthly on backup host
# - Regex has been tested and works
# - Script is not yet tested

ARCHIVES=$(ls | grep -E "[0-9A-Za-z]+-data-\d{4}-\d{2}-([^0][0-9]|[0-9][^1])_.*")

for archive in $ARCHIVES; do
    if [ -d $archive ]; then
        echo "Removing $archive"
        rm -f $archive
    fi
done

