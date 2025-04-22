#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change
for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space."$sid" left \
        --subscribe space."$sid" aerospace_workspace_change \
        --set space."$sid" \
        background.color=0x44ffffff \
        background.height=20 \
        background.drawing=off \
        background.padding_left=5\
        background.padding_right=5\
        label.padding_left=$PADDING             \
        label.padding_right=6             \
        label.font.size=14.0 \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospacer.sh $sid"
done

