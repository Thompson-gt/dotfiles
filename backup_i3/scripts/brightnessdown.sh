#!/bin/bash

brightnessctl set 10%- --quiet
curr=$(brightnessctl | grep "Current" | awk '{print$4}')
notify-send "Brightness Turned Down: "$'\n'"Currently: ${curr:1:-1}"
