## Task 2: System Health Check 
## Create a script that: 
## - Checks the system’s CPU and memory usage. 
## - Reports if the CPU usage is above 80% or if the available memory is below 20%. 
## - Logs the results to a file named system_health.log.


#!/bin/bash

# Log file path
LOG_FILE="system_health.log"

# Get current date and time
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Check CPU usage
CPU_IDLE=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
CPU_USE=$((100 - CPU_IDLE))
CPU_THRESHOLD=80.0

# Check available memory percentage
MEMORY_AVAILABLE=$(free | grep Mem | awk '{print $7/$2 * 100.0}')
MEMORY_THRESHOLD=20.0

# Initialize log entry
LOG_ENTRY="[$DATE]---"

# Check if CPU usage is above the threshold
if (( $(echo "$CPU_USE > $CPU_THRESHOLD" | bc -l) )); then
  LOG_ENTRY+=" - WARNING: CPU usage is above ${CPU_THRESHOLD}%!"
else
 LOG_ENTRY+=" - INFO: CPU usage is  ${CPU_USE}% !"
fi

# Check if available memory is below the threshold
if (( $(echo "$MEMORY_AVAILABLE < $MEMORY_THRESHOLD" | bc -l) )); then
  LOG_ENTRY+=" - WARNING: Available memory is below ${MEMORY_THRESHOLD}%!"
else
   LOG_ENTRY+=" - INFO: Available memory is ${MEMORY_AVAILABLE}%!"
fi

# Append the log entry to the log file
echo "$LOG_ENTRY" >> "$LOG_FILE"

echo "System health check completed. Results logged in $LOG_FILE."
