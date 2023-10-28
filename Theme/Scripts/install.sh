#!/bin/bash
#|---/ /+--------------------------+---/ /|#
#|--/ /-| Main installation script |--/ /-|#
#|-/ /--| Prasanth Rangan          |-/ /--|#
#|/ /---+--------------------------+/ /---|#

# Function to display a banner
show_banner() {
    cat << "EOF"

-----------------------------------------------------------------
      _  _                  _     _
     | || |_  _ _ __ _ _ __| |___| |_ ___
     | __ | || | '_ \ '_/ _` / _ \  _(_-<
     |_||_|\_, | .__/_| \__,_\___/\__/__/
           |__/|_|

-----------------------------------------------------------------

EOF
}

# Function to install packages
install_packages() {
    cat << "EOF"

 _         _       _ _ _
|_|___ ___| |_ ___| | |_|___ ___
| |   |_ -|  iclecc.md |  | . |
|_|_|_|___|_| |__,|_|_|_|_|_|_  |
                            |___|

EOF

    # Prepare package list
    shift $((OPTIND - 1))
    cust_pkg=$1
    cp custom_hypr.lst install_pkg.lst

    if [ -f "$cust_pkg" ] && [ ! -z "$cust_pkg" ]; then
        cat "$cust_pkg" >> install_pkg.lst
    fi

    # Add Nvidia drivers to the list
    if nvidia_detect; then
        # Adjust the logic for Fedora kernel headers and package names.
        sudo dnf install -y \
            https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf install -y \
            https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf install -y kernel-headers-$(uname -r)
        sudo dnf install -y akmod-nvidia
    else
        echo "Nvidia card not detected, skipping Nvidia drivers..."
    fi

    # Install packages from the list
    sudo dnf install -y $(cat install_pkg.lst)
    rm install_pkg.lst
}

# Function to restore custom configurations
restore_configs() {
    cat << "EOF"

             _           _
 ___ ___ ___| |_ ___ ___|_|___ ___
|  _| -_|_ -|  iclecc.md |  | . |
|_| |___|___|_| |___|_| |_|_|_|_  |
                              |___|

EOF

    # You need to provide the appropriate script names for restoring configs.
     ./restore_fnt.sh
     ./restore_cfg.sh
}

# Function to update SDDM, GRUB, and Zsh
update_system() {
    # You should adjust this line to fit the Fedora equivalent of restore_sgz.sh.
     echo "Updating SDDM, GRUB, and Zsh on Fedora..."
}

# Function to enable system services
enable_services() {
    cat << "EOF"

                 _
 ___ ___ ___ _ _|_|___ ___ ___
|_ -| -_|  _| | | | iclecc.md
|___|___|_|  \_/|_|___|___|___|

EOF

    # Adjust service names for Fedora.
    service_ctl NetworkManager
    service_ctl bluetooth
    service_ctl sddm
}

# Display the banner
show_banner

# Import variables and functions
source global_fn.sh
if [ $? -ne 0 ]; then
    echo "Error: Unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi

# Evaluate options
flg_Install=0
flg_Restore=0
flg_Service=0

while getopts "idrs" RunStep; do
    case $RunStep in
    i) flg_Install=1 ;;
    d) flg_Install=1
        export use_default="--assumeyes" ;;  # Change this flag for Fedora package manager
    r) flg_Restore=1 ;;
    s) flg_Service=1 ;;
    *) echo "...valid options are..."
       echo "i : [i]nstall hyprland without configs"
       echo "r : [r]estore config files"
       echo "s : start system [s]ervices"
       exit 1 ;;
    esac
done

if [ $OPTIND -eq 1 ]; then
    flg_Install=1
    flg_Restore=1
    flg_Service=1
fi

# Perform actions based on the options
if [ $flg_Install -eq 1 ]; then
    install_packages
fi

if [ $flg_Restore -eq 1 ]; then
    restore_configs
fi

if [ $flg_Install -eq 1 ] && [ $flg_Restore -eq 1 ]; then
    update_system
fi

if [ $flg_Service -eq 1 ]; then
    enable_services
fi

