#!/bin/bash

# Log file to monitor
LOG_FILE="/var/log/syslog"

# Function to handle cleanup and exit
cleanup() {
    echo "Stopping log monitoring..."
    exit 0
}

# Trap Ctrl+C signal to call cleanup function
trap cleanup SIGINT

# Function to monitor log file for new entries
monitor_log() {
    echo "Monitoring log file: $LOG_FILE"
    tail -f "$LOG_FILE" | while read line; do
        echo "$line"
        # Add your log analysis code here
    done
}


# Main function
main() {
    monitor_log
}

# Call main function
main

