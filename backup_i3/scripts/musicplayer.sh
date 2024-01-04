#!/bin/bash
players=$(playerctl --list-all)


function handleFirefix() {
    s=$(playerctl --player=firefox metadata --format "{{trunc(xesam:title,30)}} -{{trunc(xesam:artist,20)}}")
    echo $s
}
    

function handleSpotify() {
    len=$(playerctl --player=spotify metadata --format "{{duration(mpris:length)}}")
    at=$(playerctl  --player=spotify metadata --format "{{duration(position)}}")
    s=$(playerctl   --player=spotify metadata --format "{{trunc(title,30)}} -{{trunc(artist,20)}}")

# check for & because that cannot be displayed in bar 
if grep -q "&" <<< $s ;then
    # removes the & from the text
    curr=$(playerctl --player=spotify metadata --format "{{trunc(title,30)}} -{{trunc(artist,20)}}" | sed -r 's/&/,/g')
else 
    # if it doesnt exist then just return the original text
    curr=$s
    fi 

    FINAL="$curr ($at/$len)"
    echo $FINAL
}

if [[ $players == *"firefox"* ]]; then
    data=$(playerctl --player=firefox metadata)
    if [[ $data == *"Twitch"* ]]; then
        handleSpotify
    else
        handleFirefix
    fi
else
    handleSpotify
fi


