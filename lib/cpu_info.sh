#!/bin/bash

. config/cut_strings.sh

function display_cpu_info {
    local option="$1"

    echo -e "\nCPU Info:"

    if [ "$option" == "s" ]; then
        cut_strings_to lscpu $CPU_STOP_WORD
    else 
        cut_strings_to lscpu
    fi
}

# display_cpu_info "s"