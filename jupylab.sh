#!/bin/sh
SCRIPT_DIR=$(dirname $(realpath "$0"))
up() {
    docker-compose --project-directory "${SCRIPT_DIR}" up -d \
    && sleep 3 \
    && docker exec pyspark-jupylab sh -c "jupyter server list" \
    | sed -e 's,//[[:alnum:]]*:,//localhost:,'
}

down() {
    docker-compose --project-directory "${SCRIPT_DIR}" down
}

help() {
    printf "Usage: jupylab.sh {up|down}\n"
}

case $1 in
    "up")
        up
        ;;
    "down")
        down
        ;;
    *)
        help
        ;;
esac
