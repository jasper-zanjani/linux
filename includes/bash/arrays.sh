# Define a new, empty array
NAMES=()

# Add element to array
NAMES+=("Adam")

# Copy array
ARGS="${NAMES[@]}"

# Iterate over array
for name in "${NAMES[@]}"; do
    echo $name
done
