function connect_headphones
    set -f m (bluetoothctl devices | awk '{print$2}')
    set -f mac (echo $m | awk '{print$1}')
    bluetoothctl connect $mac 
end
