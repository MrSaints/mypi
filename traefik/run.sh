#!/bin/bash

set -e

export VERSION=v2.9.6

docker network create traefik || true

docker compose pull

docker compose up -d --remove-orphans --force-recreate
