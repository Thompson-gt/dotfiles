#!/bin/bash
echo "script needs to be ran with sudo permissions!"
OUT=~/
URL="https://go.dev/dl/go1.20.5.linux-amd64.tar.gz"
#get anything that has go1 becuase the name will change depending on the version
NEW_BIN=$(ls | grep go1.*)

# will download the current binary from go website
get_new_bin(){
    wget -P $1 $2
}
# will replace the out of date version of golang
replace_go(){
    rm -rf /usr/local/go && tar -C /usr/local -xzf $1
}

get_new_bin $OUT $URL
if [ -e /usr/local/go ]; then 
    CURR=/usr/local/go/VERSION
    if [ ${NEW_BIN:4:4} > ${CURR:4:4} | bc]; then
        echo "new verison found... \n updating now"
        replace_go $NEW_BIN
    else
        echo "current version of go is up to date"
        echo "exiting now..."
        exit 0
    fi
else
    echo "no version of go on system"
    echo "installing now..."
    tar -C /usr/local -xzf $NEW_BIN
fi

