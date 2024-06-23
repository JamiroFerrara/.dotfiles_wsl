#!/bin/zsh
lines=""
while read -r line
do
   lines+="\n$line"
done < /dev/stdin

echo "$lines"
lines=$(printf "%s" "$lines" | sed 's/"/\\"/g')

# if [ -z "$1" ]; then
# user_input=$(gum input --placeholder "What would you like to know?")
# fi
#

# ctx='
#   "ctx": {
#     "user": {
#         "CodiceToken": "B4604BD4-3399-4217-8822-C7E0AECE26B1",
#         "CodiceUtente": "CCALLI",
#         "DescrizioneUtente": "User Test",
#         "CodiceAbiDefault": "03599",
#         "CodiceAbiUser": "03599",
#         "DescrizioneBancaDefault": "Cassa Centrale Banca",
#         "CodiceHolding": "03599",
#         "DescrizioneHolding": "Cassa Centrale Banca",
#         "ProfiloUtente": null,
#         "ForceTknRefresh": true,
#         "LoadBookmarks": true
#     },
#     "application": {
#         "CodApplicazione": 254,
#         "DescrizioneApplicazione": "NPLs"
#     },
#     "device": {
#         "Type": "DESKTOP",
#         "Modello": "PC",
#         "TouchEnabled": false
#     },
#     "deviceConfig": {
#         "callerMode": "Web",
#         "referralUrl": "",
#         "server": "https://portalpoint-t1.collaudo.servizi.allitude.it/cssbserv",
#         "timeout": 180000
#     },
#     "numberOfCalls": 0,
#     "serviceHistory": []
#   }
# }
# '

user_input="Create an xh post request using https://portalpoint-t1.collaudo.servizi.allitude.it/cssbserv/ProcessiControlliNormativa.NetCore/api/ as base url and mapping body as $lines"


API_ENDPOINT="https://api.openai.com/v1/chat/completions"
AUTH_TOKEN="Bearer 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"

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
#
# tmux capture-pane -p -S - | nvim -c 'set scl=no' -c 'set buftype=nofile' -c 'set nonumber' -c 'setlocal norelativenumber' -c 'set filetype=sh' -c 'normal GKJ<Esc> <leader>ut' -c:g/^$/d
tmux copy-mode -u
sleep infinity
