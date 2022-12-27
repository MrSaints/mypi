#!/bin/bash

set -e

export VERSION=v2.23.0

docker network create traefik || true

docker compose pull

env UID=$(id -u) GID=$(id -g) docker compose up -d --remove-orphans --force-recreate
