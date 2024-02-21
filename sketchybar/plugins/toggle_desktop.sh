#!/bin/bash

# Get the current value of the CreateDesktop key
current_value=$(defaults read com.apple.finder CreateDesktop)

# Check if the current value is true or false and toggle it accordingly
if [ "$current_value" == "true" ]; then
    defaults write com.apple.finder CreateDesktop false
    defaults write com.apple.WindowManager StandardHideWidgets -int 1
else
    defaults write com.apple.finder CreateDesktop true
    defaults write com.apple.WindowManager StandardHideWidgets -int 0
fi

# Restart Finder to apply the changes
killall Finder

