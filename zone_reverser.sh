#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_zone_file> <output_reverse_zone_file>"
  exit 1
fi

input_file=$1
output_file=$2

if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

while read -r line; do
  name=$(echo "$line" | awk '{print $1}')
  class=$(echo "$line" | awk '{print $2}')
  type=$(echo "$line" | awk '{print $3}')
  value=$(echo "$line" | awk '{print $4}')

  if [ -n "$name" ] && [ "${name:0:1}" != ";" ] && [ -n "$class" ] && [ -n "$type" ] && [ -n "$value" ]; then
    if [ "$type" = "A" ]; then
      IFS='.' read -r -a octets <<< "$value"
      reversed_octets="${octets[2]}.${octets[1]}.${octets[0]}"
      echo "$reversed_octets.in-addr.arpa    $class    PTR    $name" >> "$output_file"
    else
      echo "$line" >> "$output_file"
    fi
  else
    echo "$line" >> "$output_file"
  fi

done < "$input_file"
