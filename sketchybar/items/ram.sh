#!/usr/bin/env bash

COLOR="$WHITE"

sketchybar -m --add item ram_percentage right --set ram_percentage \
	update_freq=3											\
	background.padding_left=$PADDING						\
	background.padding_right=$PADDING						\
	--add item ram_label right								\
	--set ram_label											\
	update_freq=1											\
	label.color="$COLOR"									\
	label.padding_right=100									\
	label=RAM												\
	label.padding_right=$PADDING							\
	background.height=26									\
	background.corner_radius="$CORNER_RADIUS"				\
	background.border_width="$BORDER_WIDTH"					\
	background.border_color="$COLOR"						\
	background.color="$BAR_COLOR"							\
	background.drawing=off									\
	script="$PLUGIN_DIR/ram.sh"




