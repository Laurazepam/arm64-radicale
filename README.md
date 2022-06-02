# arm64 Docker container for radicale
[![Docker Image Size](https://img.shields.io/docker/image-size/laurazepam/arm64-radicale/latest)](https://hub.docker.com/repository/docker/laurazepam/arm64-radicale/tags) [![GitHub Release](https://img.shields.io/github/v/release/Laurazepam/arm64-radicale?color=orange)](https://github.com/Laurazepam/arm64-radicale/releases/latest) [![Docker Pulls](https://img.shields.io/docker/pulls/laurazepam/arm64-radicale?color=purple)](https://hub.docker.com/r/laurazepam/arm64-radicale) [![Maintained](https://img.shields.io/maintenance/yes/2022)]()

This is an arm64 compatible Docker container for [radicale](https://www.lradicale.org/).

---

Radicale is a powerful CalDAV/CardDAV server. This container is meant for running your personal calendar and contacts server from a RaspberryPi (3B+ or later) or other arm based SBCs.

## Usage

**NOTE**: The Docker command provided is just an example
and should be adjusted to your own needs.

Launch the radicale docker container with the following command:
```
docker run -d \
    --name=radicale \
    -p 5232:5232 \
    -v /docker/radicale/config/:/etc/radicale/config/:rw \
    -v /docker/radicale/data/:/var/lib/radicale/collections/:rw \
    -v /docker/radicale/users/:/users/:rw \
    laurazepam/arm64-radicale
```

Where:
  - `5232`: Published port of the container (this is where you will reach the server)
