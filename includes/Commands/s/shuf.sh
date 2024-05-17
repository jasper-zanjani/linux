# Print random selection of integers from {x} to {y} (inclusive) without replacement
shuf -i x-y

# Print random selection of integers from {x} to {y} (inclusive), with replacement
shuf -i x-y -r

# Shuffle items separated by newline in file `cards.txt`, displaying only one 
shuf -n 1 items.txt

# Random dictionary words
shuf -n 5 /usr/share/dict/words