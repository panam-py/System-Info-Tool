#!/bin/bash


# Function to retrieve the output of a function till a particular word is founc
function cut_strings_to {
    local command="$1"
    local stop="$2"

    echo "Function called with command: $1 and stop word: $2"

    if [[ -z "$stop" ]]; then
      eval "$command"
      return 0
    fi

    # Execute command and pipe the output to awk
    eval "$command" | awk -v stop="$stop" '
   #  BEGIN {print "AWK processing started..."}
    {
        print $0;
        if (index($0, stop) > 0) {
            exit;  # Exit on finding the stop word
        }
    }'
}

# output=$(cut_strings_to "$1" "$2")
# cut_strings_to "$1" "$2"