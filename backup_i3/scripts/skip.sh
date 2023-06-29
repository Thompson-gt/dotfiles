#!/bin/bash
SONG=$(playerctl metadata --format "{{title}}")
ARTIST=$(playerctl metadata --format "-{{artist}}")
playerctl next && notify-send "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "action: SKIPPED" -i ~/Pictures/forwards_finger.png



