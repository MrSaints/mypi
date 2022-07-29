#!/bin/bash

set -e

export VERSION=v2.8.1

docker network create traefik || true

docker compose up -d --remove-orphans --force-recreate
