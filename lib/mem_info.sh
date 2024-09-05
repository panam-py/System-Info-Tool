#!/bin/bash

function display_mem_info {
    local option="$1"

    echo -e "\nMemory info:"

    if [ "$option" == "s" ]; then
        free -mt
    else
        free -mt && vmstat -s 
    fi

}

