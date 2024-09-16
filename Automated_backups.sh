## Task 4: Automated Backup
## Create a script that: 
## - Takes a directory path as input from the user.
## - Compresses the directory into a .tar.gz file. 
## - Saves the compressed file with a name that includes the current date (e.g., backup_2023-08-20.tar.gz). 

#!/bin/bash

# Prompt the user to enter the directory path
read -p "Enter the directory path to backup: " DIR_PATH

# Check if the entered directory path is valid
if [[ ! -d "$DIR_PATH" ]]; then
  echo "Error: Directory path ($DIR_PATH) is not valid!"
  exit 1
fi

# Get the current date in YYYY-MM-DD format
CURRENT_DATE=$(date '+%Y-%m-%d')

# Extract the directory name from the path (for naming purposes)
DIR_NAME=$(basename "$DIR_PATH")

# Define the backup file name with the current date
BACKUP_FILE="${DIR_NAME}_backup_${CURRENT_DATE}.tar.gz"

# Compress the directory into a .tar.gz file
tar -czf "$BACKUP_FILE" -C "$(dirname "$DIR_PATH")" "$DIR_NAME"

# Confirm the backup creation
if [[ $? -eq 0 ]]; then
  echo "Backup created successfully: $BACKUP_FILE"
else
  echo "Error: Failed to create backup."
fi