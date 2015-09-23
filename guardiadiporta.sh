#!/bin/bash
echo "Getting connected clients list on $(date)"
/usr/bin/ssh root@192.168.2.10 wl assoclist > /home/pi/guardiadiporta/stations_dump
