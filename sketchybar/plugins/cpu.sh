#!/bin/bash

CPU=$(top -l 1 | awk '/^CPU usage:/ {print $3}' | tr -d '%' | cut -d "." -f1)

sketchybar --set $NAME \
  icon="󰍛" \
  icon.color=0xFFb4befe \
  label="$CPU%"

