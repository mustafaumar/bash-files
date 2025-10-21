# Log Analysis Automation Script

A simple yet effective **Bash script** for analyzing log files within a specified directory, detecting critical errors, and generating a summarized report.  
This tool helps system administrators and analysts quickly identify log anomalies such as `ERROR`, `FATAL`, and `CRITICAL` messages.

---

## Features

- Scans a specified log directory for files modified in the last 24 hours  
- Searches for key error patterns: **ERROR**, **FATAL**, and **CRITICAL**  
- Counts the occurrences of each error type in every log file  
- Generates a detailed text report summarizing findings  
- Displays a **warning** when a log file contains more than 10 critical entries  

---

### How It Works

The script finds all .log files in the LOG_DIR that were modified in the last 24 hours.

For each file, it:

- Searches for occurrences of ERROR, FATAL, and CRITICAL.

- Logs each match and its count to the report.

- Displays a warning in the terminal if more than 10 instances are found.

- Results are saved to:
```
/Users/macbook/logs/log_analysis_report.txt
```

---

### Notes

- You can change LOG_DIR to any directory of your choice.
- To adjust the time window, modify the -mtime -1 value (e.g., -mtime -2 for 48 hours).
- Ensure you have read permissions for all log files in the directory.

