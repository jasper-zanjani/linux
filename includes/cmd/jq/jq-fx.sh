INPUT=fx.json # (1)

jq '.users' $INPUT # (2)
jq '.users[0]' $INPUT # (3)
jq '.users[] | select(.name == "Bob")' $INPUT # (4)
jq '.users | length' $INPUT # => 3
jq '.users[] | select( .profile .location | contains("Zur"))' $INPUT
