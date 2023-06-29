#!/bin/bash
SONG=$(playerctl metadata --format "{{title}}")
ARTIST=$(playerctl metadata --format "-{{artist}}")
#notify-send "SKIPPED: \\n song: ${CURR}"
playerctl previous && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: PREVIOUS" -i ~/Pictures/backwards_finger.png 
