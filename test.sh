#!/bin/sh
touch ./status.json

# Build image
make build

# Cleanup previous container
docker stop game-status
docker rm game-status

# Start container
docker run -d \
  --name game-status \
  -e TYPE="quake3" \
  -e HOST="pickup.ra3.se" \
  -e PORT="27960" \
  -v "${PWD}/status.json:/status.json" \
  ra3se/game-status

# Host it
docker stop game-status-http
docker rm game-status-http

docker run --name game-status-http -d \
    -v "${PWD}/status.json:/web/status.json" \
    -p 8080:8080 \
    halverneus/static-file-server:latest
