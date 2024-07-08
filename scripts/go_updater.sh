#!/bin/bash
OUT=~/Downloads
unformated_version=$(curl --silent "https://go.dev/VERSION?m=text")
CURR_GO=$(cat "/usr/local/go/VERSION")
LATEST_GO=${unformated_version:0:8}
URL="https://go.dev/dl/${LATEST_GO}.linux-amd64.tar.gz"

# will download the current binary from go website
dowload_latest_go(){
    wget -P $1 $2
}
# will replace the out of date version of golang
replace_go(){
    rm -rf /usr/local/go && tar -C /usr/local -xzf $1
}

#needs to run as sudo to modify the /usr/local/ dir
if [  `id -u` -ne 0 ]; then
    echo "need to run as sudo or root" 
    exit 1
fi

if [ -e /usr/local/go ]; then 
    if [ $LATEST_GO != ${CURR_GO:0:8} ]; then
        echo "new verison found... \n updating now..."
        dowload_latest_go $OUT $URL
        replace_go "${OUT}/${LATEST_GO}.linux-amd64.tar.gz"
    else
        echo "current version of go is up to date "
        echo "exiting now..."
        exit 0
    fi
else
    echo "no version of go on system"
    echo "installing now..."
    dowload_latest_go $OUT $URL
    tar -C /usr/local -xzf "${OUT}/${LATEST_GO}.linux-amd64.tar.gz"
fi
