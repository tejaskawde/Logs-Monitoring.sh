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
    tail -n 50  "$LOG_FILE" | while read line; do
        echo "$line"
        # Add your log analysis code here
        analyze_log "$line"
    done
}

# Function to analyze log entries and generate summary report
analyze_log() {
    local log_entry="$1"
    # Check if log entry contains an error message
    if echo "$log_entry" | grep -i -q "ERROR"; then
        # Extract error message
        error_message=$(echo "$log_entry" | awk -F 'ERROR ' '{print $2}')
        # Increment count for error message
        ((error_counts["$error_message"]++))
        # Print summary report if 100 log entries are reached
        if (( ${#error_counts[@]} % 100 == 0 )); then
            generate_summary_report
        fi
    fi
}

# Function to generate summary report of top 5 error messages
generate_summary_report() {
    echo "=== Top 5 Error Messages ==="
    # Sort error messages by count in descending order and select top 5
    sorted_errors=$(printf "%s\n" "${!error_counts[@]}" | sort -rn -k1,1 -t$'\n' | head -n 5)
    # Print top 5 error messages and their counts
    for error_message in $sorted_errors; do
        echo "$error_message: ${error_counts[$error_message]}"
    done
}

# Main function
main() {
    declare -A error_counts
    monitor_log
}

# Call main function
main

