#!/bin/bash

set -ex

# Disable Swap
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove
sudo swapoff --all
sudo apt-get remove dphys-swapfile
free -m
