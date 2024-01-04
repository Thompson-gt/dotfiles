#!/bin/bash
SONG=$(playerctl   --player=spotify metadata --format "{{title}}")
ARTIST=$(playerctl --player=spotify metadata --format "-{{artist}}")
#notify-send "SKIPPED: \\n song: ${CURR}"
playerctl --player=spotify previous && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: PREVIOUS" -i ~/Pictures/backwards_finger.png -u normal 
