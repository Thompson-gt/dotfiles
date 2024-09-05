function lockdir 
    sudo chown --recursive root $argv[1]
    sudo chmod --recursive go-rwx $argv[1]
end
