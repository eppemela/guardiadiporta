#!/bin/bash
echo "Getting connected clients list on $(date)"
deploy_dir=`pwd`

/usr/bin/ssh root@192.168.2.10 wl assoclist > $deploy_dir/stations_dump
