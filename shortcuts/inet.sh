#!/bin/bash

#sudo ip link set wlan0 up && \
#sudo systemctl restart  dhcpcd NetworkManager && \
sleep 10 && sudo iw dev wlan0 set power_save off
