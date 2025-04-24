```sh
git init

# Define an upstream repo
git remote add origin $REPO

# Before a first commit, the global email and user name must be set.
git config --global user.name $NAME
git config --global user.email $EMAIL

# Add and commit as normal
git add .
git commit -m $MESSAGE

# The first push must have the upstream repo set
git push --set-upstream origin master
```


