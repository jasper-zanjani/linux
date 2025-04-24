# Update index to include all files in the working tree, including removals
git add -A # --no-ignore-removal

# Stage all modifications in work-tree, including deletions
git add -u

# Add file, located in **\$HOME** to the git repo at **\$PATH**
git --git-dir=$PATH/.git --work-tree=$HOME add $FILE
