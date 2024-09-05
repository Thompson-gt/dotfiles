function unlockdir 
    sudo chmod  ug+rwx $argv[1]
    sudo chown --recursive $USER $argv[1]
    sudo chmod --recursive ug+rw $argv[1]
end
