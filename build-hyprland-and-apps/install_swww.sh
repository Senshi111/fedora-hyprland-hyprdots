#!/bin/bash

sudo dnf copr enable -y alebastr/sway-extras
sudo dnf install -y swww
# Return to the previous directory
cd ..
