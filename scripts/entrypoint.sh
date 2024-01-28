#!/bin/bash
# Exit if a command exits with a non-zero status.
set -e  

# Always run commandOne.sh when the container starts
echo "Running commandOne.sh..."
/app/scripts/commandOne.sh

# Check if RUN_COMMAND_TWO is set to "true" and run commandTwo.sh
if [ "$RUN_COMMAND_TWO" == "true" ]; then
    echo "Running commandTwo.sh..."
    /app/scripts/commandTwo.sh
fi

# Execute the Docker CMD
exec "$@"
