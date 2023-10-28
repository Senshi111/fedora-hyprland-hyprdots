#!/bin/bash
#|---/ /+---------------------------------------------+---/ /|#
#|--/ /-| Script to install pkgs from input list      |--/ /-|#
#|-/ /--| Prasanth Rangan                             |-/ /--|#
#|/ /---+---------------------------------------------+/ /---|#

source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi

# Check if Git is installed and install it if not
if ! command -v git &>/dev/null; then
    echo "Installing dependency git..."
    sudo dnf update
    sudo dnf install -y git
fi



install_list="${1:-install_pkg.lst}"
pkg_fedora=""

while read pkg; do
    if rpm -q $pkg &>/dev/null; then
        echo "Skipping $pkg..."
    elif dnf info $pkg &>/dev/null; then
        echo "Queueing $pkg from Fedora repo..."
        pkg_fedora="${pkg_fedora} $pkg"
    else
        echo "Error: Unknown package $pkg..."
    fi
done < $install_list

if [ -n "$pkg_fedora" ]; then
    echo "Installing $pkg_fedora from Fedora repo..."
    sudo dnf update
    sudo dnf install -y $pkg_fedora
fi
