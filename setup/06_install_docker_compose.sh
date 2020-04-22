#!/bin/bash

set -ex

# Install Docker Compose via Pip3 (Python)

sudo apt-get update -y
sudo apt-get install -y python3-pip

sudo pip3 install docker-compose
