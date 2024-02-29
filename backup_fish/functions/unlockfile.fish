function unlockfile
    sudo chown $USER "$1"
    sudo chmod ug+rw "$1"
end
