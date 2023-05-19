#!/bin/sh
mkdir -p /mnt/server
cd /mnt/server

apk add --no-cache --update runuser

adduser --disabled-password --home /mnt/server tc

runuser -l "tc" -c "ghost install local --no-setup --no-start --dir /mnt/server/ghost"
ghost config --ip 0.0.0.0
ghost config --port $SERVER_PORT
ghost config --url $EGGOPT_URL
ghost config --admin-url $EGGOPT_ADMINURL
ghost config --db mysql --dbhost $EGGOPT_DBHOST --dbname $EGGOPT_DBNAME --dbuser $EGGOPT_DBUSER --dbpass $EGGOPT_DBPASS

find /mnt/server/ghost/* -type d -exec chmod 775 {} \;
find /mnt/server/ghost/* -type d -exec chmod 664 {} \;

#runuser -l "tc" -c "ghost doctor --dir /mnt/server/ghost"

exit 0