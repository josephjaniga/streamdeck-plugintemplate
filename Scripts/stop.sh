#!/bin/bash

# find and kill StreamDeck.exe
output_string="$(tasklist | grep StreamDeck.exe)"
echo $output_string
IFS=' '
read -ra output_array <<< "$output_string"
output_pid=${output_array[1]}
echo $output_pid
if [[ ! -z "$output_pid" ]]; then
  taskkill //F //T //PID "${output_pid}"
fi

sleep 1