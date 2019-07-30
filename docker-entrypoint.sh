#!/bin/bash

if [[ "$1" = "sonar-scanner" ]]; then
    cd /opt/sonarqube/sources && exec "$@"
else
    ./bin/run.sh "$@"
fi
