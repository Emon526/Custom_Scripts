#!/bin/bash

# Get the current platform
platform=$(uname -s)

# Get the current directory
cwd=$(pwd)

# Function to copy and make executable
copy_and_make_executable() {
  sudo cp "$1" /usr/local/bin
  sudo chmod +x /usr/local/bin/$(basename "$1")
  echo "Copied and made executable: $(basename "$1")"
}

# Check the platform and perform operations
case "$platform" in
  Linux*)
    echo "Detected Linux"
    for file in "$cwd"/*.sh; do
      [ -f "$file" ] && copy_and_make_executable "$file"
    done
    ;;
  Darwin*)
    echo "Detected macOS"
    for file in "$cwd"/*.sh; do
      [ -f "$file" ] && copy_and_make_executable "$file"
    done
    ;;
  CYGWIN*|MINGW32*|MSYS*|MINGW*)
    echo "Detected Windows"
    for file in "$cwd"/*.sh; do
      [ -f "$file" ] && copy_and_make_executable "$file"
    done
    ;;
  *)
    echo "Unsupported platform: $platform"
    exit 1
    ;;
esac
