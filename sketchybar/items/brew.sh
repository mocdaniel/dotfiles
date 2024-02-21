#!/bin/bash

# Trigger the brew_udpate event when brew update or upgrade is run from cmdline
# e.g. via function in .zshrc

POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

brew=(
	icon=􀐛
	label=?
	padding_right=10
	update_freq=180
	popup.align=right
	script="$PLUGIN_DIR/brew.sh"
	click_script="$POPUP_CLICK_SCRIPT"
)

brew_template=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
	icon.background.height=2
	icon.background.y_offset=-12
)

sketchybar --add event brew_update \
	--add item brew right \
	--set brew "${brew[@]}" \
	--subscribe brew brew_update \
	mouse.entered \
	mouse.exited \
	mouse.exited.global \
	system_woke \
	--add item brew.template popup.brew \
	--set brew.template "${brew_template[@]}"
