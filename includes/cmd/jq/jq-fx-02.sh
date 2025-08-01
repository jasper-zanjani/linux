jq '.users[] | select(.name == "Bob")' $INPUT # (4)
