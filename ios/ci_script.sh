#!/bin/bash

# Exit if any command fails
set -e

# Check if we're on the 'main' branch
if [ "$GITHUB_REF" == "refs/heads/main" ]; then
  echo "Releasing the app..."
  
  # Navigate to the ios directory
  if [ -d "ios" ]; then
    cd ios
  else
    echo "Directory 'ios' does not exist."
    exit 1
  fi
  
  # Run Fastlane
  if command -v fastlane >/dev/null 2>&1; then
    fastlane release_app
  else
    echo "Fastlane is not installed."
    exit 1
  fi
else
  echo "Not on the 'main' branch. Skipping deployment."
fi

echo "CI script finished successfully."
