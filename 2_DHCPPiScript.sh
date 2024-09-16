#!/bin/bash

sudo apt install isc-dhcp-server
sudo sed -i 's/^INTERFACESv4=""/INTERFACESv4="eth0"/' /etc/default/isc-dhcp-server
sudo sed -i '/^default-lease-time 600;/a \
subnet 192.168.0.0 netmask 255.255.255.0 {\
 range 192.168.0.5 192.168.0.250;\
 option routers 192.168.0.1;\
 option domain-name-servers 192.168.0.1;\
 option domain-name "overheadcam.local";\
}' /etc/dhcp/dhcpd.conf

# Getting around using GUI for configuration by copying Wired connection file
# to NetworkManager directory
cd ~/scan-score-scripts
cp './Wired connection 1.nmconnection' '/etc/NetworkManager/system-connections/Wired connection 1.nmconnection'

sudo reboot now
