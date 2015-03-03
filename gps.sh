#!/bin/bash
killall gpsd
sleep 2
touch ./streamed_data/gps.txt
gpsd /dev/ttyAMA0 -F /var/run/gpsd.sock
sleep 2
gpspipe -w -l -t -o ./streamed_data/gps.txt &
