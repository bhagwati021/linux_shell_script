## Task 5: Simple To-Do List
## Create a Bash script that:
## - Implements a simple command-line to-do list.
## - Allows the user to add tasks, view tasks, and remove tasks.
## - Saves the tasks to a file (e.g., todo.txt).

#!/bin/bash

# File to store tasks
TODO_FILE="todo.txt"

# Ensure the todo file exists
touch "$TODO_FILE"

add_task() {
  echo -n "Enter a new task: "
  read -r TASK
  echo "$TASK" >> "$TODO_FILE"
  echo "Task added."
}
# Function to view tasks
view_tasks() {
  echo "Your current tasks:"
  cat -n "$TODO_FILE"
}
remove_task() {
  view_tasks
  echo -n "Enter the task number to remove: "
  read -r TASK_NUM
  sed -i "${TASK_NUM}d" "$TODO_FILE"
  echo "Task removed."
}
# Menu loop
while true; do
  echo -e "\nTo-Do List Menu:"
  echo "1. View tasks"
  echo "2. Add a task"
  echo "3. Remove a task"
  echo "4. Exit"
  echo -n "Choose an option: "
  read -r OPTION

  case $OPTION in
    1) view_tasks ;;
    2) add_task ;;
    3) remove_task ;;
    4) echo "Goodbye!"; exit 0 ;;
    *) echo "Invalid option, please try again." ;;
  esac
done
