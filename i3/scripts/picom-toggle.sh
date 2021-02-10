#!/bin/bash

pgrep -x picom > /dev/null && { killall picom; exit 0; }
picom -b
