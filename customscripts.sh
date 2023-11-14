#!/bin/bash

# Get the current directory
cwd=$(pwd)

# Search the folder for files
for file in $(ls "$cwd");
do

  # Copy the file to /usr/local/bin
  sudo cp "$cwd/$file" /usr/local/bin

  # Make the file executable
  sudo chmod +x /usr/local/bin/"$file"

  # Print the status of the file
  echo "Copied and made executable: $file"

done