function connect_headphones
    set -f mac (bluetoothctl devices | awk '{print$2}')
    bluetoothctl connect $mac
end
