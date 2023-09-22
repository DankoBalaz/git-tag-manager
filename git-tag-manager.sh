#!/bin/bash

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: purge-tags.sh <start-tag> <end-tag> <absolute-path-to-repo>"
    exit 1
fi

START_TAG="$1"
END_TAG="$2"
REPO="$3"
cd "$REPO"

# Verify tag existence in the repository
if ! git rev-parse "$START_TAG" >/dev/null 2>&1; then
    echo "Error: Tag $START_TAG not found!"
    exit 1
fi

if ! git rev-parse "$END_TAG" >/dev/null 2>&1; then
    echo "Error: Tag $END_TAG not found!"
    exit 1
fi

# Ensure START_TAG is less than END_TAG
if ! echo -e "$START_TAG\n$END_TAG" | sort -Vc 2>/dev/null; then
    echo "Error: $START_TAG is not less than $END_TAG!"
    exit 1
fi

# Store tags to be deleted in a variable
TAGS_TO_DELETE=$(git tag | sort -V | awk -v start="$START_TAG" -v end="$END_TAG" 'start <= $0 && $0 <= end')

# Purge tags locally
echo "$TAGS_TO_DELETE" | xargs git tag -d

echo "Tags between $START_TAG and $END_TAG have been removed locally."

# Ask user for confirmation to delete tags from remote
read -p "Do you want to remove these tags from the remote repository? (y/n): " confirm

if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    echo "$TAGS_TO_DELETE" | xargs -I {} git push origin :refs/tags/{}
    echo "Tags between $START_TAG and $END_TAG have been removed from the remote repository."
else
    echo "Tags were not removed from the remote repository."
fi
