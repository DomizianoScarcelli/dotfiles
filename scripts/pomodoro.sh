#!/bin/bash

# Function for work mode
work() {
    local duration=${1:-25m}  # Default to 5 minutes if no argument is provided
    timer "$duration"
    osascript -e 'display notification "☕" with title "Work Timer is up!" subtitle "Take a Break 😊" sound name "Crystal"'
}

# Function for rest mode
rest() {
    local duration=${1:-5m}  # Default to 10 minutes if no argument is provided
    timer "$duration"
    osascript -e 'display notification "☕" with title "Break is over" subtitle "Back to work, loser ䷑" sound name "Crystal"'
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
