#!/bin/bash

# pgrep -x wp-change.sh > /dev/null || wp-change.sh
while true; do
    /bin/bash ~/.config/i3/scripts/wp-change.sh
    sleep 3m
done
