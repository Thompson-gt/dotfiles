function unlockdir 
    sudo chmod  ug+rwx "$1"
    sudo chown --recursive $USER "$1"
    sudo chmod --recursive ug+rw "$1"
end
