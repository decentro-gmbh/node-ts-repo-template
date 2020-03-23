#!/bin/bash

# Get path of this script so that we can use paths relative to this script's path
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Use docker-compose to start the twitter-extract container
docker-compose -p t5s -f $SCRIPTPATH/docker-compose.yml up --build -d

# Attach to dev container if a TTY is present
if [ -z "${CI}" ]
then
  docker exec -it twitter-extract bash
fi
