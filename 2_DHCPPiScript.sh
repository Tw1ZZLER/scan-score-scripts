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



# Getting around using GUI for NetworkManager configuration
# by using awesome built-in CLI tools
nmcli connection add con-name "Wired connection 1" type ethernet

# This is editing what would normally be handled by the GUI network configuration
# We are doing it this way so we don't need to use the desktop.
sudo sed -i '/\[ipv4\]/{n; c\address1=192.168.0.1/24,192.168.0.1
n; i
}' '/etc/NetworkManager/system-connections/Wired connection 1.nmconnection'
sudo sed -i '/address1=192.168.0.1\/24,192.168.0.1/a method=manual' '/etc/NetworkManager/system-connections/Wired connection 1.nmconnection'

sudo reboot now
