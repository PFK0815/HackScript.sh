#!/bin/sudo /bin/bash

exitfunction() {
    killall yes
    killall head tail
    killall stress.sh
    exit
}
trap exitfunction SIGINT

stress_cpu() {
    num_cpus=$(($(nproc) - 1))
    for ((i=0; i<num_cpus; i++)); do
        yes > /dev/null & 
    done
}

stress_ram() {
    mem_info=$(LANG=C free | awk '/Mem/')
    ram_total=$(echo "$mem_info" | awk '{ print $2 }')
    swap_used=$(LANG=C free | awk '/Swap/ { print $3 }')
    swap_total=$(echo "$mem_info" | awk '{ print $2 }')
    total_half=$((ram_total / 2))
    head -c $total_half"KB" /dev/zero | tail
    #head -c "1024MB" /dev/zero | tail
}

stress_cpu &
stress_ram &

while true; do
    sleep 1000
done