#!/bin/bash

# Function to install packages
install_packages() {
    sudo dnf install -y "$@"
}

# Add repositories and update system here if needed

# Install required packages
install_packages \
wl-clipboard \
go \
gtk3-devel \
  xdg-utils \
  swappy \
  rust \
  cargo \
python-cairo \
alsa-ucm \ 
alsa-firmware \
google-noto-emoji-fonts \
google-noto-emoji-color-fonts \
pamixer \
# Install dependencies for wlroots
export PATH=$PATH:/usr/local/go/bin


sudo dnf copr enable -y alebastr/sway-extras 
sudo dnf install -y swww



