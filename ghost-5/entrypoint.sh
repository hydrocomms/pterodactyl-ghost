#!/bin/bash
clear
export GHOST_INSTALLED="/home/container/ghost"

# Colours, courtesy of Code Grepper (:
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

mkdir -p $GHOST_INSTALLED
cd $GHOST_INSTALLED

echo "[EGG]: Entering entrypoint ($IMAGE_VERSION with CLI $BOLD$(ghost version | tail -1 | cut -d' ' -f3)$NORMAL)"

function run() {
    echo "Starting Ghost.. ($IMAGE_VERSION with CLI $BOLD$(ghost version | tail -1 | cut -d' ' -f3)$NORMAL)"
    echo "To change the public-facing URL or admin URL, please edit the variables in Pterodactyl."
    echo "The port is set to the primary port allocation. To edit this, you will need to modify the primary allocation in Pterodactyl."
    ghost config --process local --port $SERVER_PORT --url $EGGOPT_URL --ip 0.0.0.0 --admin-url $EGGOPT_ADMINURL --db mysql --dbhost $EGGOPT_DBHOST --dbname $EGGOPT_DBNAME --dbuser $EGGOPT_DBUSER --dbpass $EGGOPT_DBPASS --dbport $EGGOPT_DBPORT
    node current/index.js
}

if [[ ! "${STARTUP}" == "/usr/bin/false" ]]; then
    echo "[EGG]: Startup command has been modified by manual intervention. Utilising custom startup instead.."
    ${STARTUP}
else
    echo "[EGG]: Startup command has not been modified, continuing with default startup.."
    run
fi