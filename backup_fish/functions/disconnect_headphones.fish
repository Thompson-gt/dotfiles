function disconnect_headphones
    set -f mac (bluetoothctl devices | awk '{print$2}')
    bluetoothctl disconnect $mac
end
