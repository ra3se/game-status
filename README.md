# game-status
Simple docker image for collecting game server status at a interval and storing that as a JSON file.
This uses [gamedig](https://github.com/gamedig/node-gamedig) and should be compatible with all games listed [here](https://github.com/gamedig/node-gamedig#games-list).

## Usage

Start the container

```bash
docker run \
  -e TYPE="quake3" \
  -e HOST="pickup.ra3.se" \
  -e PORT="27960" \
  -v "${PWD}/status.json:/status.json" \
  -d ra3se/game-status:latest
```
