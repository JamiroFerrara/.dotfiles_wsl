#!/bin/bash

# Function to convert JSON block to single-line representation
json_to_single_line() {
  jq -c '.' <<< "$1" | tr '\n' ' '
}

# Function to convert single-line representation back to JSON block
single_line_to_json() {
  jq -c '.' <<< "$1"
}

# Read the JSON data from stdin into a variable
json_data=$(cat)

# Convert the JSON blocks to single-line representations
single_line_data=$(jq -c -r '.logTree[]' <<< "$json_data" | while read -r line; do json_to_single_line "$line"; echo; done)

# Use fzf to filter the single-line representations
selected_single_line=$(echo "$single_line_data" | fzf)

# Convert the selected single-line back to the original JSON block
selected_json_block=$(single_line_to_json "$selected_single_line")

echo "$selected_json_block" | jq
