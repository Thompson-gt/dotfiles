#!/bin/bash

MIN_LENGTH=0
MAX_LENGTH=100
WINDOW=$(xdotool getactivewindow getwindowname)
echo ${WINDOW:$MIN_LENGTH:$MAX_LENGTH}
