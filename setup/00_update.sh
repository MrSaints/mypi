#!/bin/bash

set -ex

# Update System

sudo apt update -y
sudo apt upgrade -y

# Update Firmware
sudo rpi-eeprom-update
# sudo rpi-eeprom-update -a
# sudo reboot
