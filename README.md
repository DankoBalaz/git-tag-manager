# Git Tag Manager: Efficiently Manage Your Git Tags
Git Tag Manager streamlines the process of cleaning up and managing your Git tags. Tailored for developers and maintainers looking to declutter their repositories, our utility aids in the removal of specific tags or ranges, ensuring a clean and organized versioning system.

### Key Features:
- **Range-Based Purging:** Easily specify a range of tags for bulk removal.
- **Safety First:** Test-run feature to see the tags that would be removed, ensuring no accidental deletions.
- **Remote Cleanup:** Option to push changes to remote repositories, making tag management seamless across teams.
### Benefits:
- **Optimized Repositories:** Clean up obsolete tags and maintain a polished versioning system.
- **Enhanced Collaboration:** Provides team members with a clearer picture by removing cluttered and unnecessary tags.
- **Time Efficiency**: Instead of manually deleting tags one by one, use Git Tag Purger to automate the process.

## Usage:
```bash
./git-tag-manager.sh <start-tag> <end-tag> <absolute-path-to-repo>
```
This script deletes all git tags that fall between `<start-tag>` and `<end-tag>` **last tag inclusive**.

## Requirements:

- git

## Installation:

1. **Clone this repository**:

```bash
git clone https://github.com/DankoBalaz/git-tag-manager.git
```

```bash
./git-tag-manager.sh v1.64.1 v1.64.3 /home/$USER/projects/my-project-with-a-lot-of-tags
This example will delete all tags from v1.0.0 up to and including v2.0.0.
Deleted tag 'v1.64.1' (was <commit>)
Deleted tag 'v1.64.2' (was <commit>)
Deleted tag 'v1.64.3' (was <commit>)
Tags between v1.64.1 and v1.64.3 have been removed locally.
Do you want to remove these tags from the remote repository? (y/n): y
Tags were not removed from the remote repository.
```
If you choose not to remove tags, just select `n` and then `git fetch` to restore tags.