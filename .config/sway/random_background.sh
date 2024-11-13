#!/bin/sh

BACKGROUND_DIR="$HOME/Pictures/hackers"
RANDOM_BACKGROUND=""

random_background()
{
  RANDOM_PIC="$BACKGROUND_DIR/$(ls "$BACKGROUND_DIR" | shuf -n 1)"
}

random_background
if [ RANDOM_PIC = "" ]; then
  echo "No background to get, is your background folder not $BACKGROUND_DIR?"
  exit 1
fi


RUNNING_SWAY_PROC="$(pidof swaybg | awk '{print $1;}')"
if [ RUNNING_SWAY_PROC ]; then
  kill $RUNNING_SWAY_PROC
fi

swaybg -i "$RANDOM_PIC" -m fill > /dev/null 2>&1 &
