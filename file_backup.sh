## Task 1: File Management Script 
## Write a Bash script that: 
## - Creates a directory named "backup" in the user's home directory.
## - Copies all .txt files from the current directory i.to the "backup" directory. 
## - Appends the current date and time to the filenames of the copied files.


#!/bin/bash
# Step 1: Create a directory named "backup" in the user's home directory if it doesn't exist
BACKUP_DIR="$HOME/backup"
mkdir -p "$BACKUP_DIR"

# Step 2: Copy all .txt files from the current directory to the "backup" directory
for file in *.txt; do
  if [ -f "$file" ]; then  # Check if the file exists
    # Step 3: Append the current date and time to the filenames of the copied files
    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
    cp "$file" "$BACKUP_DIR/${file}_$TIMESTAMP.txt"
  fi
done

echo "Backup complete. All .txt files have been copied to $BACKUP_DIR with the current date and time appended to their filenames."
