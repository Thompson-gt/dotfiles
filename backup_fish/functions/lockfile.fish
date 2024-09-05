function lockfile
    sudo chown root $argv[1]
    sudo chmod go-rw $argv[1]
    
end
