#!/bin/bash

set -e

export VERSION=2022.07.1
export LOCAL_IP=$(hostname -I | cut -d' ' -f1)
export VIRTUAL_HOST=pihole.home.local

docker network create traefik || true

docker compose up -d --remove-orphans --force-recreate
