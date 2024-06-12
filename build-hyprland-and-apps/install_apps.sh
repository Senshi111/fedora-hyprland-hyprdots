#!/bin/bash

# Function to install packages
install_packages() {
    sudo dnf install -y "$@"
}

# Add repositories and update the system here if needed

# Install required packages
install_packages \
    pipewire \
    wireplumber \
    network-manager-applet \
    brightnessctl \
    qt6-qtwayland \
    dunst \
    rofi-wayland \
    swayidle \
    wlogout \
    grim \
    slurp \
    polkit-kde \
    xdg-desktop-portal-gtk \
    ImageMagick \
    pavucontrol \
    qt6-qtbase-devel \
    ffmpegthumbs \
    qt5-qtimageformats \
    qt6-qtbase \
    kvantum \
    qt5ct \
    qt6ct \
    waybar \
    parallel \
    dolphin \
    sddm \
    firefox \
    kde-cli-tools \
    fastfetch
