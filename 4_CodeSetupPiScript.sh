#!/bin/bash

source env/bin/activate
sudo apt install python3-opencv
sudo env/bin/pip install board
git clone https://github.com/Scan-Score/led_signatures ~/led_signatures
sudo env/bin/pip install adafruit-circuitpython-lis3mdl

# Quarterback RPi
# Username: polarrobotics
# Password: polarrobotics
