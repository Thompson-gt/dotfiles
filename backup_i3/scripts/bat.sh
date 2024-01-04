#!/bin/bash
bat=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percent)
percent=${bat:15:12}


echo $percent
