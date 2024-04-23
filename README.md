# Log Monitoring and Analysis Script

This Bash script monitors a specified log file in real-time, analyzes log entries for error messages, and generates a summary report of the top 5 error messages.


## Prerequisites

- Linux-like operating system (Unix, macOS)
- Bash shell
- Permission to access the log file (usually requires sudo or appropriate permissions)
- Basic understanding of shell scripting

## Usage

1. **Clone the Repository:**
    - git clone https://github.com/tejaskawde/Logs-Monitoring.sh.git
2. **Navigate to the Directory:**
    - cd log-monitor.sh
3. **Set Execution Permissions (if necessary):**
    - chmod +x log_monitor.sh


4. **Execute the Script:**
    - ./log_monitor.sh


5. **Monitor Log Activity:**
    - The script will start monitoring the specified log file (`/var/log/syslog` by default) in real-time. Press `Ctrl+C` to stop monitoring and exit.

6. **View Summary Report:**
    - While the script is running, it will periodically generate a summary report of the top 5 error messages based on their occurrence counts.

## Customization

- **Log File:**
You can customize the log file to monitor by editing the `LOG_FILE` variable in the script.

- **Log Analysis:**
Implement your custom log analysis logic within the `monitor_log` function. Modify the section labeled "Add your log analysis code here" to perform actions based on log entries.

## Testing

To test the script, you can simulate log activity by manually adding entries to the log file being monitored (`/var/log/syslog` by default). Once the script is running, observe how it responds to the new log entries.

## Important Note

Ensure that the script is executed with appropriate permissions to access the log file and that any log analysis code added is safe and does not inadvertently affect system stability.










