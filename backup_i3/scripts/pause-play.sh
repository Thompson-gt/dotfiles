#!/bin/bash
#SONG=$(playerctl --player=spotify metadata --format "{{title}}")
#ARTIST=$(playerctl --player=spotify metadata --format "-{{artist}}")
#STATUS=$(playerctl --player=spotify status)
players=$(playerctl --list-all)
blacklist=("9anime" "Twitch")

if [[ $players == *"firefox"* ]]; then
    data=$(playerctl --player=firefox metadata)
    block=false
    for item in "${blacklist[@]}"; do 
        if [[ $data == *"$item"* ]]; then
            block=true
        fi
    done

    if [ $block = true  ]; then
        SONG=$(playerctl   --player=spotify metadata --format "{{title}}")
        ARTIST=$(playerctl --player=spotify metadata --format "{{artist}}")
        STATUS=$(playerctl --player=spotify status)
        PLAYER="spotify"

    else
        SONG=$(playerctl   --player=firefox metadata --format "{{trunc(xesam:title,30)}}")
        ARTIST=$(playerctl --player=firefox metadata --format "{{xesam:artist}}")
        STATUS=$(playerctl --player=firefox status)
        PLAYER="firefox"
    fi

else
    SONG=$(playerctl   --player=spotify metadata --format "{{title}}")
    ARTIST=$(playerctl --player=spotify metadata --format "{{artist}}")
    STATUS=$(playerctl --player=spotify status)
    PLAYER="spotify"
fi






if [[ $STATUS == "Playing" ]]; then
    playerctl --player=$PLAYER play-pause && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: PAUSED" -i ~/Pictures/center_finger.png -u normal
else
    playerctl --player=$PLAYER play-pause && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: PLAYING" -i ~/Pictures/center_finger.png -u normal 
fi



