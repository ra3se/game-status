#!/bin/sh

/usr/bin/gamedig --type "$TYPE" "$HOST:$PORT" > /status.json
