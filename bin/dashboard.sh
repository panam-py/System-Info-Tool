#!/bin/bash

# Load libaries
. lib/cpu_info.sh
. lib/mem_info.sh
. lib/disk_info.sh
. lib/process_info.sh

# Default Settings
show_cpu=false
show_memory=false
show_disk=false
show_process=false
verbose=false

# Set an indicator to check if flags were passed
no_flags=true

# Parse command-line options
while getopts "cmdpv" opt; do
    no_flags=false
    case $opt in
        c)
            show_cpu=true
            ;;
        m)
            show_memory=true
            ;;
        d)
            show_disk=true 
            ;;
        p)
            show_process=true
            ;;
        v)
            verbose=true
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done 

# Return an error if no flags were passed
if [ "$no_flags" = true ]; then 
    echo "Error: no options provided. Usage: $0 [-c] [-m] [-d] [-v]"
    exit 1
fi

# Setting environment variables
export CPU_STOP_WORD="Flags:"

# Display Header
echo "System Information Dashboard"
date
echo "----------------------------"

# Set a variable to act as the argument for the functions
verb_opt="s"

# Unset the variable if the user does not want a verbose response
if [ "$verbose" = true ]; then unset verb_opt; fi

# Call functions based on flags
if [ "$show_cpu" = true ]; then display_cpu_info $verb_opt; fi
if [ "$show_memory" = true ]; then display_mem_info $verb_opt; fi
if [ "$show_disk" = true ]; then display_disk_info; fi
if [ "$show_process" = true ]; then display_running_processes; fi

# # Function Calls
# display_cpu_info "s"
# display_mem_info "s"
# display_disk_info
# display_running_processes

# Log output
echo "Dashboard ran at $(date)" >> logs/dashboard.log