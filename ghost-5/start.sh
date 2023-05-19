#!/bin/sh
docker run -it -p 80:80 -e STARTUP="bash" ghcr.io/hydrocomms/pterodactyl-ghost:5