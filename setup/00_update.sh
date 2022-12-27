#!/bin/bash

set -ex

# Update System

sudo apt update -y
sudo apt upgrade -y

# For mkcert
sudo apt install -y libnss3-tools

# Update Firmware
sudo rpi-eeprom-update
# sudo rpi-eeprom-update -a
# sudo reboot
