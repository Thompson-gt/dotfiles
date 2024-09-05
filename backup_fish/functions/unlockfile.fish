function unlockfile
    sudo chown $USER $argv[1]
    sudo chmod ug+rw $argv[1]
end
