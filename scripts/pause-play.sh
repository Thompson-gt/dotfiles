#!/bin/bash
SONG=$(playerctl metadata --format "{{title}}")
ARTIST=$(playerctl metadata --format "-{{artist}}")
STATUS=$(playerctl status)
#notify-send "SKIPPED: \\n song: ${CURR}"
if [[ $STATUS == "Playing" ]]; then
    playerctl play-pause && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: PAUSED" -i ~/Pictures/center_finger.png 
else
    playerctl play-pause && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: PLAYING" -i ~/Pictures/center_finger.png 
fi
