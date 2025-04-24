# Show commits between January 1 and January 5, 2016
git log --after="2016-01-01" --before="2016-01-05"

# See commits that are on a branch but not on master
git log $MASTER..$BRANCH

