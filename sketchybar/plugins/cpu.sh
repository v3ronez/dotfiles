#!/usr/bin/env bash

sketchybar --set "$NAME" label="CPU  $(ps -A -o %cpu | awk '{s+=$1} END {s /= 8} END {printf "%.1f%%\n", s}')"

