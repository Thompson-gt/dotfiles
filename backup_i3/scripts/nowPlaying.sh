#!/bin/bash
# this will be the script to display more info for the song when clicked
WORKING_FILE=~/tmp/ablumArt.temp
players=$(playerctl --list-all)

if [[ $players == *"firefox"* ]]; then
    data=$(playerctl --player=firefox metadata)
    if [[ $data == *"Twitch"* ]]; then
        SONG=$(playerctl   --player=spotify metadata --format "{{title}}")
        ARTIST=$(playerctl --player=spotify metadata --format "{{artist}}")
        ALBUM=$(playerctl --player=spotify metadata --format "{{album}}")
        COVER_ART=$(playerctl --player=spotify metadata --format "{{mpris:artUrl}}")

    else
        SONG=$(playerctl   --player=firefox metadata --format "{{trunc(xesam:title,30)}}")
        ARTIST=$(playerctl --player=firefox metadata --format "{{xesam:artist}}")
        ALBUM=$(playerctl --player=firefox metadata --format "{{xesam:album}}")
        COVER_ART=$(playerctl --player=firefox metadata --format "{{mpris:artUrl}}")
    fi

else
    SONG=$(playerctl   --player=spotify metadata --format "{{title}}")
    ARTIST=$(playerctl --player=spotify metadata --format "{{artist}}")
    ALBUM=$(playerctl --player=spotify metadata --format "{{album}}")
    COVER_ART=$(playerctl --player=spotify metadata --format "{{mpris:artUrl}}")
fi

handle_press () {
    xdotool key "Super_L+m" > /dev/null
}
# both of these funcions are just place holders in the switch case
handle_dismiss () {
    exit 0 
}
handle_timeout () {
    exit 0 
}

if [ ! -e "$WORKING_FILE" ]; then 
    touch $WORKING_FILE
fi

curl $COVER_ART --output $WORKING_FILE -s
ACTION=$(dunstify --action="default,press" --action="timeout,timeout" "Title: ${SONG}"$'\n'"Artist: ${ARTIST}" "Ablum: ${ALBUM}" -i $WORKING_FILE -u critical)

case $ACTION in
"default")
    handle_press
    ;;
"1")
    handle_timeout
    ;;
"2")
    handle_dismiss
    ;;
esac

