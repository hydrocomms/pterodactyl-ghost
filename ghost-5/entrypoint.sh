#!/bin/sh
clear
export GHOST_INSTALLED="/home/container/ghost"

cd /home/container

mkdir -p /home/container/content

echo "[EGG]: Entering entrypoint (Ghost container 5)"

function run() {
    echo "Started A!"
    ghost start --dir "$GHOST_INSTALLED" --color true
}

if [[ ! "${STARTUP}" == "/usr/bin/false" ]]; then
    echo "[EGG]: Startup command has been modified by manual intervention. Utilising custom startup instead.."
    ${STARTUP}
else
    echo "[EGG]: Startup command has not been modified, continuing with default startup.."
    run
fi