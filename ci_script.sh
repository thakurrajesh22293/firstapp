#!/bin/bash

# Exit if any command fails
set -e

# Deploy if needed
if [ "$BITBUCKET_BRANCH" == "main" ]; then
  echo "Releasing the app..."
  
  # Navigate to the ios directory
  cd ios
  
  # Run Fastlane
  fastlane release_app
fi

echo "CI script finished successfully."
