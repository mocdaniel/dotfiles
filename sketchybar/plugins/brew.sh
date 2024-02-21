#!/opt/homebrew/bin/bash

source "$CONFIG_DIR/colors.sh"

PACKAGES=()
readarray -t PACKAGES <<<$(brew outdated)

COLOR=$RED
COUNT=${#PACKAGES[@]}

case ${#PACKAGES[@]} in
[3-5][0-9])
	COLOR=$ORANGE
	;;
[1-2][0-9])
	COLOR=$YELLOW
	;;
[1-9])
	COLOR=$WHITE
	;;
0)
	COLOR=$GREEN
	COUNT=􀆅
	;;
esac

args+=(
	--set $NAME label="$COUNT" icon.color=$COLOR
	--remove '/brew.listing\.*/'
)

for package in "${PACKAGES[@]}"; do
	listing=(
		label="$package"
		position="popup.brew"
		drawing=on
		click_script="brew upgrade \"$package\"; sketchybar --set brew popup.drawing=off; sleep 5; sketchybar --trigger brew_update"
	)

	args+=(--clone brew.listing.$package brew.template --set brew.listing.$package "${listing[@]}")
done

sketchybar -m "${args[@]}" >/dev/null

popup() {
	sketchybar --set $NAME popup.drawing=$1
}

case "$SENDER" in
"mouse.entered")
	popup on
	;;
"mouse.exited" | "mouse.exited.global")
	popup off
	;;
"mouse.clicked")
	popup toggle
	;;
esac
