#!/bin/sh

# Check if both required arguments are specified
if [ $# -lt 2 ]; then
    echo "Error: Parameters were not specified."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir represents a directory on the filesystem
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a directory."
    exit 1
fi

# Count the number of files in the directory and all subdirectories
X=$(find "$filesdir" -type f | wc -l)

# Count the number of lines matching the search string
Y=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the final output message
echo "The number of files are $X and the number of matching lines are $Y"
