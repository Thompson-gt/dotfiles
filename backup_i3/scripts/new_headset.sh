#!/bin/bash
HEADPHONES_MAC=$(bluetoothctl devices | awk '{print$2}')
connected=$(bluetoothctl info $HEADPHONES_MAC | grep "Paired"| awk '{print$2}')

if [ *"${connected}"*  == *"yes"* ]; then {
    p=$(bluetoothctl info $HEADPHONES_MAC | grep "Battery Percentage" | awk '{print$4}')
    echo $p"%"
} 
fi

