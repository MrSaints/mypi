#!/bin/bash

set -ex

# Install Tailscale for mesh VPN
# Source: https://tailscale.com/kb/1025/install-rpi

curl https://pkgs.tailscale.com/stable/raspbian/buster.gpg | sudo apt-key add -

curl https://pkgs.tailscale.com/stable/raspbian/buster.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt update -y

sudo apt install -y tailscale

sudo tailscale up

ifconfig tailscale0
