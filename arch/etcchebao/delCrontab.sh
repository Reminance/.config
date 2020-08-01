#!/usr/bin/bash

crontab -u $1 -l | grep -v syncEtcData.sh | crontab -u $1 -


