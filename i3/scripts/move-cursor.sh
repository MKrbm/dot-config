#!/usr/bin/env bash
XDT=/usr/bin/xdotool

WINDOW=`$XDT getwindowfocus`

# this brings in variables WIDTH and HEIGHT
eval `$XDT getwindowgeometry --shell $WINDOW`

#echo "Current window geometry:"
#echo "Width: $WIDTH"
#echo "Height: $HEIGHT"

if [ $HEIGHT -gt 100 ]
then
  TX=`expr $WIDTH / 2`
  TY=`expr $HEIGHT / 2`

  #echo "Calculated values (window geometry > 100):"
  #echo "TX: $TX"
  #echo "TY: $TY"

  $XDT mousemove -window $WINDOW $TX $TY
else
  rect=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).rect')

  x=$(jq -r '.x' <<< $rect)
  y=$(jq -r '.y' <<< $rect)
  w=$(jq -r '.width' <<< $rect)
  h=$(jq -r '.height' <<< $rect)

  #echo "Current workspace geometry:"
  #echo "x: $x"
  #echo "y: $y"
  #echo "width: $w"
  #echo "height: $h"

  TX=`expr $x + $w / 2`
  TY=`expr $y + $h / 2`

  #echo "Calculated values (workspace geometry):"
  #echo "TX: $TX"
  #echo "TY: $TY"

  $XDT mousemove -window $WINDOW $TX $TY
fi

