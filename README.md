# arm64 Docker container for radicale
[![Docker Image Size](https://img.shields.io/docker/image-size/laurazepam/arm64-radicale/latest)](https://hub.docker.com/repository/docker/laurazepam/arm64-radicale/tags) [![GitHub Release](https://img.shields.io/github/v/release/Laurazepam/arm64-radicale?color=orange)](https://github.com/Laurazepam/arm64-radicale/releases/latest) [![Docker Pulls](https://img.shields.io/docker/pulls/laurazepam/arm64-radicale?color=purple)](https://hub.docker.com/r/laurazepam/arm64-radicale) [![Maintained](https://img.shields.io/maintenance/yes/2022)]()

This is an arm64 compatible Docker container for [radicale](https://www.lighttpd.net/).

---

Radicale is a powerful CalDAV/CardDAV server. This container is meant for running your personal calendar and contacts server from a RaspberryPi (3B+ or later) or other arm based SBCs.

## Usage

**NOTE**: The Docker command provided is just an example
and should be adjusted to your own needs.

Launch the lighttpd docker container with the following command:
```
docker run -d \
    --name=radicale \
    -p 5235:5235 \
    laurazepam/arm64-radicale
```

Where:
  - `5235`: Published port of the container (this is where you will reach the server)
