#!/bin/sh

# Check if both required arguments are specified
if [ $# -lt 2 ]; then
    echo "Error: Parameters were not specified."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract the directory path from the full file path
destdir=$(dirname "$writefile")

# Create the directory path if it does not exist
if [ ! -d "$destdir" ]; then
    mkdir -p "$destdir"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory path '$destdir'."
        exit 1
    fi
fi

# Write the string to the file, overwriting any existing content
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: File '$writefile' could not be created or written."
    exit 1
fi

exit 0
