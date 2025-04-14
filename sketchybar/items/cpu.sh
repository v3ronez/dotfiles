#!/usr/bin/env bash

COLOR="$WHITE"

sketchybar --add item cpu right \
	--set cpu \
	update_freq=3 \
	icon.padding_left=0 \
	icon.padding_right=10 \
	label.color="$COLOR" \
	label.padding_right=$PADDING \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.padding_right=5\
	background.padding_left=5\
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=off \
	script="$PLUGIN_DIR/cpu.sh"
