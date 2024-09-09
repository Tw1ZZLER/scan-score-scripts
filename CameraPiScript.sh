#!/bin/bash

sudo apt update
sudo apt upgrade
wget -O install_pivariety_pkgs.sh https://github.com/ArduCAM/Arducam-Pivariety-V4L2-Driver/releases/download/install_script/install_pivariety_pkgs.sh
chmod +x install_pivariety_pkgs.sh
./install_pivariety_pkgs.sh -p libcamera_dev
./install_pivariety_pkgs.sh -p libcamera_apps
sudo sed -i '/^\[all\]/a dtoverlay=imx519,cam0,vcm=off' /boot/firmware/config.txt
sudo reboot now
