#!/bin/bash
HEADPHONES_MAC=$(bluetoothctl devices | awk '{print$2}')
ICON="🎧"


connected=$(bluetoothctl info $HEADPHONES_MAC | grep "Connected"| awk '{print$2}')

if [ *"${connected}"*  == *"yes"* ]; then {
    p=$(bluetoothctl info $HEADPHONES_MAC | grep "Battery Percentage" | awk '{print$4}')
    echo $ICON$p"%"
} 
fi

