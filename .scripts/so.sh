#!/bin/bash
user_input="$*"

# Check if the prompt is provided as an argument
if [ -z "$1" ]; then
user_input=$(gum input --placeholder "Do you even stack overflow?")
fi

so $user_input
