#!/bin/bash
len=$(playerctl metadata --format "{{duration(mpris:length)}}")
at=$(playerctl metadata --format "{{duration(position)}}")
S=$(playerctl metadata --format "{{trunc(title,30)}} -{{trunc(artist,20)}}")

# check for & because that cannot be displayed in bar 
if grep -q "&" <<< $S ;then
    # removes the & from the text
    curr=$(playerctl metadata --format "{{trunc(title,30)}} -{{trunc(artist,20)}}" | sed -r 's/&/,/g')
else 
    # if it doesnt exist then just return the original text
    curr=$S
fi 

FINAL="$curr ($at/$len)"
echo $FINAL


