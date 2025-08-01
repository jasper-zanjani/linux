```sh title="jq and jp syntaxes"
# Display only a single key.
jp -f $INPUT "users"
jq '.users' $INPUT

# Only the first element of a list
jp -f $INPUT "users[0]"
jq '.users[0]' $INPUT

# Filter a list for a value
jp -f $INPUT "users[?name == 'Bob']"
jq '.users[] | select(.name == "Bob")' $INPUT

# Filter for elements containing a string
jp -f $INPUT "users[?contains(profile.location, `Zur`)]"
jq '.users[] | select( .profile .location | contains("Zur"))' $INPUT

# Measure length of a list
jp -f $INPUT "length(users)"
jq '.users | length' $INPUT
```

