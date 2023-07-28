#!/usr/bin/bash

# Prunes container data folders monthly on backup host.
# Removes all items but the backup from the first day of the month.
# Should run on the first day of every month - since it doesn't remove the backup
# from that time, it doesn't matter what time it's run

for item in *; do
    if [[ "$item" =~ [0-9A-Za-z]+-data-[0-9]{4}-[0-9]{2}-([^0][0-9]|[0-9][^1])_.* ]]; then
        echo "Removing $item"
        rm -f $item
    fi
done

