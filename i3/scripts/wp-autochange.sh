#!/bin/bash

pgrep wp-autochange.sh > /dev/null && exit 0

while true; do
    /bin/bash ~/.config/i3/scripts/wp-change.sh
    sleep 3m
done
