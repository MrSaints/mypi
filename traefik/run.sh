#!/bin/bash

set -e

export VERSION=v2.5.3

docker network create traefik || true

docker-compose up -d --remove-orphans --force-recreate
