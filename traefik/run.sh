#!/bin/bash

set -e

export VERSION=v2.2

docker network create traefik || true

docker-compose up -d --remove-orphans --force-recreate
