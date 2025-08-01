INPUT=fx.json # (1)

jp -f $INPUT "users" # (2)
jp -f $INPUT "users[0]" # (3)
jp -f $INPUT "users[?name == 'Bob']" # (4)
jp -f $INPUT "users[?contains(profile.location, `Zur`)]" # (5)
jp -f $INPUT "users[].{name: name, location: profile.location }" # (6)
jp -f $INPUT "length(users)" # => 3
