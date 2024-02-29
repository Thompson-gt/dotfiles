function lockfile
    sudo chown root "$1"
    sudo chmod go-rw "$1"
end
