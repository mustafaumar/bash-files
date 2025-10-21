
#!/bin/bash
LOG_DIR="/Users/macbook/logs"
ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")
REPORT_FILE="/Users/macbook/logs/log_analysis_report.txt"

echo "Analyzing log files" > "$REPORT_FILE"
echo "==================" >> "$REPORT_FILE"

echo -e "\nList of files that was modified in the last 24 hours" >> "$REPORT_FILE"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do

echo -e "\n===================================================" >> "$REPORT_FILE"
echo "============ $LOG_FILE ============" >> "$REPORT_FILE"
echo "===================================================" >> "$REPORT_FILE"

	for PATTERN in ${ERROR_PATTERNS[@]}; do

		echo -e "\nSearching $PATTERN logs in $LOG_FILE file" >> "$REPORT_FILE"
		grep "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

		echo -e "\nNumber of $PATTERN logs found in $LOG_FILE file" >> "$REPORT_FILE"
		ERROR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
		echo $ERROR_COUNT >> "$REPORT_FILE"

		if [ "$ERROR_COUNT" -gt 10 ]; then
			echo -e "\n Warning!!! Too many $PATTERN errors in log file $LOG_FILE"
		fi
	done
done                        

echo -e "\nLog analysis completed and report saved in: $REPORT_FILE"
