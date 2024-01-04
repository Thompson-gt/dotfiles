#!/bin/bash
SONG=$(playerctl   --player=spotify metadata --format "{{title}}")
ARTIST=$(playerctl --player=spotify metadata --format "-{{artist}}")
playerctl --player=spotify next && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: SKIPPED" -i ~/Pictures/forwards_finger.png -u normal



