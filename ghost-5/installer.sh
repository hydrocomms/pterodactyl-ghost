#!/bin/sh
mkdir -p /mnt/server
cd /mnt/server

ghost install --no-setup --no-start --dir "/mnt/server/ghost"
ghost config --ip 0.0.0.0
ghost config --port $SERVER_PORT
ghost config --url $EGGOPT_URL
ghost config --admin-url $EGGOPT_ADMINURL