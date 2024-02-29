function lockdir 
    sudo chown --recursive root "$1"
    sudo chmod --recursive go-rwx "$1"
end
