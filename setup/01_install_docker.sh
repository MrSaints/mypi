#!/bin/bash

set -ex

# Install Docker
# Random, unaudited, but "official" script from the internet.
# What could possibly go wrong? ¯\_(ツ)_/¯

curl -sSL https://get.docker.com | sh

# sudo usermod -aG docker pi
