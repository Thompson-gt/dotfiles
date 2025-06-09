#!/bin/bash
b_devs=$(bluetoothctl devices | awk '{print$2}' )
HEADPHONES_MAC=$(echo $b_devs | awk '{print$1}')
ICON="🎧"


connected=$(bluetoothctl info $HEADPHONES_MAC | grep "Connected"| awk '{print$2}')

if [ *"${connected}"*  == *"yes"* ]; then {
    p=$(bluetoothctl info $HEADPHONES_MAC | grep "Battery Percentage" | awk '{print$4}')
    echo $ICON$p"%"
} 
fi

