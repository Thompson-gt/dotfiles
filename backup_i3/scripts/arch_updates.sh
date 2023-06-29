#!/bin/bash

OUT="up to date"
UPDATES=$(checkupdates | wc -l)

if [ $UPDATES -lt 1 ]; then 
    echo $OUT
else
    echo "updates needed: ${UPDATES}"
fi 
