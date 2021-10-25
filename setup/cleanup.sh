#!/bin/bash

set -ex

chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

sudo apt autoclean
sudo apt autoremove
