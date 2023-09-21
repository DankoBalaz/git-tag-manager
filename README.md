# Git Tag Purger

A simple utility to purge (delete) git tags in a specified range. It will first run locally so that you can validate the range of tags and prevent accidental deletion.

## Usage:
```bash
./purge-tags.sh <start-tag> <end-tag> <absolute-path-to-repo>
```
This script deletes all git tags that fall between `<start-tag>` and `<end-tag>` **last tag inclusive**.

## Requirements:

- git

## Installation:

1. **Clone this repository**:

```bash
git clone https://github.com/DankoBalaz/tag-obliterator.git
```

```bash
./purge-tags.sh v1.64.1 v1.64.3 /home/$USER/projects/my-project-with-a-lot-of-tags
This example will delete all tags from v1.0.0 up to and including v2.0.0.
Deleted tag 'v1.64.1' (was <commit>)
Deleted tag 'v1.64.2' (was <commit>)
Deleted tag 'v1.64.3' (was <commit>)
Tags between v1.64.1 and v1.64.3 have been removed locally.
Do you want to remove these tags from the remote repository? (y/n): y
Tags were not removed from the remote repository.
```
If you choose not to remove tags, just select `n` and then `git fetch` to restore tags.