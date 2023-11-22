#!/bin/bash

# Function to install packages
install_packages() {
    sudo dnf install -y "$@"
}

# Add repositories and update the system here if needed

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
    bluez \
    bluez-tools \
    blueman \
    python3-cairo \

# Install dependencies for wlroots
export PATH=$PATH:/usr/local/go/bin

# Enable COPR repository for additional packages
sudo dnf copr enable -y alebastr/sway-extras

# Install the additional package
sudo dnf install -y swww

sudo dnf install -y \
            https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y \
            https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm



