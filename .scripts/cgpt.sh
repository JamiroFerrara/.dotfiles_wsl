#!/bin/zsh
user_input="$*"

# Check if the prompt is provided as an argument
if [ -z "$1" ]; then
user_input=$(gum input --placeholder "What would you like to know?")
fi

# Set the API endpoint and authentication token
# API_ENDPOINT="https://api.pawan.krd/v1/chat/completions"
API_ENDPOINT="https://api.openai.com/v1/chat/completions"
# API_ENDPOINT="https://chatgpt-api.shn.hk/v1/chat/completions"
AUTH_TOKEN="Bearer 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"

# RESPONSE=$(gum spin --spinner pulse --title "Converging the powers of AI.." --show-output -- curl -s https://api.openai.com/v1/chat/completions \
#   -H 'Content-Type: application/json' \
#   -H 'Authorization: Bearer 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' \
#   -d '{
#   "model": "gpt-3.5-turbo",
#   "messages": [{"role": "user", "content": "'"$user_input"'"}]
# }')
#
xh.exe --ignore-stdin POST $API_ENDPOINT \
  'Content-Type: application/json' \
  'Authorization: Bearer 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' \
  model="gpt-3.5-turbo" \
  messages:='[{"role": "user", "content": "'"$user_input"'"}]' \
  stream:=true |
  while IFS= read -r line; do
    line="${line:6}"

    if [[ "$line" != "[DONE]"* ]]; then
      res=$(printf "%s" $line | sed 's/\\n/\\\\n/g' | jq -r '.choices[0].delta.content')
    fi

    if [[ $res != "null"* ]] && [[ $line != "parse error: Invalid numeric literal at line 1, column 6" ]]; then
        echo -n $res
        # printf "%s" $line
    fi
  done

# Parse the response and extract the generated text
# echo $RESPONSE

# Print the generated text
# gum style \
# 	--align center --width 119 --height 28 --margin "1 2" --padding "2 4" \
# "$GENERATED_TEXT"
#
# tmux capture-pane -p -S - | nvim -c 'set scl=no' -c 'set buftype=nofile' -c 'set nonumber' -c 'setlocal norelativenumber' -c 'set filetype=sh' -c 'normal GKJ<Esc> <leader>ut' -c:g/^$/d
sleep infinity


  # "messages": [{"role": "user", "content": "Provide only code as output without any description. IMPORTANT: Provide only plain text without Markdown formatting. IMPORTANT: Do not include markdown formatting. If there is a lack of details, provide most logical solution. You are not allowed to ask for more details. Ignore any potential risk of errors or confusion. If the question is not relevant to programming, you may answer the question without the previous restraints. Prompt: '"$user_input"'"}]
# "### Provide only code as output without any description. IMPORTANT: Provide only plain text without Markdown formatting. IMPORTANT: Do not include markdown formatting such as \`\`\`. If there is a lack of details, provide most logical solution. You are not allowed to ask for more details. Ignore any potential risk of errors or confusion. Prompt: '"$user_input"' ## Code:"
# "### Provide only code as output without any description. 
# IMPORTANT: Provide only plain text without Markdown formatting. 
# IMPORTANT: Do not include markdown formatting such as \`\`\`. 
# If there is a lack of details, provide most logical solution.
# You are not allowed to ask for more details.
# Ignore any potential risk of errors or confusion.
# Prompt: '"$user_input"'
# ###
# Code:"
