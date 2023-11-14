#!/bin/bash

# Get the app project location
app_project_location=$(git rev-parse --show-toplevel)

# Check if the script is executed in the flutter project directory
if [[ ! -d "$app_project_location/ios" ]]; then
  echo "Error: This script should be executed from the root directory of a Flutter project."
  exit 1
fi

# Clear the dependencies of the Flutter project
flutter clean

# Update the pods
cd "$app_project_location/ios"

# Clean the pod cache to ensure a fresh installation
pod cache clean --all

# Remove the Podfile.lock file to prevent conflicts
rm Podfile.lock

# Remove the .symlinks directory to ensure a clean pod installation
rm -rf .symlinks/

# Return to the project root directory
cd ..

# Clean the Flutter project to ensure a fresh build
flutter clean

# Update the Flutter packages to ensure compatibility with the latest pods
flutter pub get

# Navigate back to the ios directory
cd "$app_project_location/ios"

# Update the pod repo to ensure access to the latest pod versions
pod repo update

# Install the pods using the --repo-update flag to ensure the repo is updated before installation
pod install --repo-update

# Update the pods again to ensure all dependencies are resolved
pod update

# Run the pod install command again to ensure a complete installation
pod install

# Return to the project root directory
cd ..

# Notify the user that the pod installation is complete
echo "Pod installation completed."