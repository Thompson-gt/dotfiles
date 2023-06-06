#!/bin/bash
echo "this script needs to be ran with sudo permisons"

#the output path for the new appimage
OUT_DIST=~
#the url of the neovim appimage
URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"

#replaces the current neovim app image with the given appimage
replace_neovim() {
    sudo rm /usr/local/nvim/nvim
    sudo mv $1 /usr/local/nvim/

}

#will fetch the new binary, argrumant 1: output location, argrumant 2: binary url
get_new_binary() {
    wget -P $1 $2
    chmod u+x ~/nvim.appimage
    #rename the binary
    cp ~/nvim.appimage ~/nvim
}

#download the new appimage
get_new_binary $OUT_DIST $URL
NEW_BINARY=~/nvim
if [ -e /usr/local/nvim/nvim ]; then 
    if  cmp -s /usr/local/nvim/nvim $NEW_BINARY; then 
        #the same
        echo "current neovim is up to date"
        rm $NEW_BINARY
    else 
        #different
        echo "new version found, replacing the old appimage"
        replace_neovim $NEW_BINARY
        echo "new verion is installed"
    fi
else 
    echo "there is no neovim on the machine, installing now..."
    if mkdir /usr/local/nvim; then
        mv $NEW_BINARY /usr/local/nvim/
        echo "neovim is now installed to /usr/local/nvim/nvim.appimage"
    else
        #if the dir exsists but not the appimage
        mv $NEW_BINARY /usr/local/nvim/
        echo "neovim is now installed to /usr/local/nvim/nvim.appimage"
    fi
fi
