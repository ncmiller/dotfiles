#!/bin/bash

format_log_entry ()
{
    read commit
    read date
    read summary
    local statnum=0
    local add=0
    local rem=0
    while true; do
        read statline
        if [ -z "$statline" ]; then break; fi
        ((statnum += 1))
        ((add += $(echo $statline | cut -d' ' -f1)))
        ((rem += $(echo $statline | cut -d' ' -f2)))
    done
    if [ -n "$commit" ]; then
        echo "$commit;$date;$summary;$statnum;$add;$rem"
    else
        exit 0
    fi
}

while true; do
    format_log_entry
done
