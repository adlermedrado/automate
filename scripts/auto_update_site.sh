#!/bin/bash

# Git repository directory
REPO_DIR=""

# Destination directory
DEST_DIR=""

# Function to check if there are updates
check_for_updates() {
  # Check if the repository directory exists
  if [ ! -d "$REPO_DIR" ]; then
    echo "Error: Repository directory '$REPO_DIR' not found."
    exit 1
  fi

  # Navigate to the repository directory
  cd "$REPO_DIR" || exit

  # Run git pull and store the result
  git_output=$(git pull)

  # Check if there are updates
  if [[ $git_output == *"Already up to date."* ]]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No updates available."
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Updates found. Copying files..."

    # Check if the destination directory exists
    if [ ! -d "$DEST_DIR" ]; then
      echo "Error: Destination directory '$DEST_DIR' not found."
      exit 1
    fi

    # Copy updated files to the nginx directory
    sudo cp -r "${REPO_DIR}/public/"* "$DEST_DIR"

    # Adjust file permissions
    sudo chown -R nginx:nginx "$DEST_DIR"

    echo "$(date '+%Y-%m-%d %H:%M:%S') - Files copied and permissions adjusted."
  fi
}

# Run the update function
check_for_updates
