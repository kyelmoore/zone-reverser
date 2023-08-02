#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <input_zone_file> <output_reverse_zone_file>"
  exit 1
fi

input_file=$1
output_file=$2

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Process the input file line by line
while read -r line; do
  # Extract fields from the line
  name=$(echo "$line" | awk '{print $1}')
  class=$(echo "$line" | awk '{print $2}')
  type=$(echo "$line" | awk '{print $3}')
  value=$(echo "$line" | awk '{print $4}')

  # Check if the line is a valid DNS record (non-empty, not a comment, and has four fields)
  if [ -n "$name" ] && [ "${name:0:1}" != ";" ] && [ -n "$class" ] && [ -n "$type" ] && [ -n "$value" ]; then
    # Check if it is an "A" record
    if [ "$type" = "A" ]; then
      # Extract IP address octets
      IFS='.' read -r -a octets <<< "$value"
      reversed_octets="${octets[2]}.${octets[1]}.${octets[0]}"
      echo "$reversed_octets.in-addr.arpa    $class    PTR    $name" >> "$output_file"
    else
      # Copy other records as they are
      echo "$line" >> "$output_file"
    fi
  else
    # Copy empty lines and comments as they are
    echo "$line" >> "$output_file"
  fi

done < "$input_file"
