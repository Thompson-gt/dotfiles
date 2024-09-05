#!/bin/bash
HEADSET_IDENT="/org/freedesktop/UPower/devices/headset_dev_90_7A_58_E7_B3_C2"
ICON="🎧"



if [[ $(upower -e) !=  *"${HEADSET_IDENT}"* ]];then
    echo ""
fi

deviceInfo=$(upower -i $HEADSET_IDENT | grep "percentage" | awk '{print $2}')
echo "$ICON$deviceInfo"
