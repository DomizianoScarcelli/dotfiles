#!/bin/bash

increase_kitty_font_size() {
    kitty @ set-font-size +15
}

# Function to reset Kitty font size
reset_kitty_font_size() {
    kitty @ set-font-size 0
}
# Function for work mode
work() {
    local duration=${1:-25m}  # Default to 25 minutes if no argument is provided
    # increase_kitty_font_size
    timer -f -n "Pomodoro Work" "$duration"
    osascript -e 'display notification "☕" with title "Work Timer is up!" subtitle "Take a Break 😊" sound name "Crystal"'
    # reset_kitty_font_size
}

# Function for rest mode
rest() {
    local duration=${1:-5m}  # Default to 5 minutes if no argument is provided
    # increase_kitty_font_size
    timer -f -n "Pomodoro Rest" "$duration"
    osascript -e 'display notification "☕" with title "Break is over" subtitle "Back to work, loser ䷑" sound name "Crystal"'
    # reset_kitty_font_size
}

# Main script logic
case "$1" in
    work)
        work "$2"
        ;;
    rest)
        rest "$2"
        ;;
    *)
        echo "Usage: $0 {work|rest} [time]"
        exit 1
        ;;
esac
