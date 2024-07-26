#!/bin/bash

# Directories
SOURCE_DIR="/path/to/source/directory"
TARGET_DIR="/path/to/target/directory"

# Check if the directories exist
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory does not exist: $SOURCE_DIR"
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "Target directory does not exist: $TARGET_DIR"
  exit 1
fi

# Iterate over files in the source directory
missing_files=0
for file in "$SOURCE_DIR"/*; do
  filename=$(basename "$file")
  if [ ! -e "$TARGET_DIR/$filename" ]; then
    echo "File missing in target directory: $filename"
    missing_files=$((missing_files + 1))
  fi
done

if [ $missing_files -eq 0 ]; then
  echo "All files from $SOURCE_DIR are present in $TARGET_DIR."
else
  echo "$missing_files file(s) are missing in the target directory."
fi
