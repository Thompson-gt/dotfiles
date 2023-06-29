#!/bin/bash
len=$(playerctl metadata --format "{{duration(mpris:length)}}")
at=$(playerctl metadata --format "{{duration(position)}}")

echo "$at/$len"
