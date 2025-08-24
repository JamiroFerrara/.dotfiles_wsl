#!/bin/bash

# Accept input from command line arguments or prompt if not provided
if [[ $# -eq 0 ]]; then
    echo "Looking for torrents?"
    read search
else
    search="$*"
fi

# Define all subcategories with their IDs
declare -A categories=(
  [audio:music]=101
  [audio:audio_books]=102
  [audio:sound_clips]=103
  [audio:FLAC]=104
  [audio:other]=199

  [video:movies]=201
  [video:movies_dvdr]=202
  [video:hd_movies]=207
  [video:music_videos]=203
  [video:movie_clips]=204
  [video:tv_shows]=205
  [video:hd_tv_shows]=208
  [video:handheld]=206
  [video:3d]=209
  [video:other]=299

  [application:windows]=301
  [application:mac]=302
  [application:UNIX]=303
  [application:handheld]=304
  [application:IOS]=305
  [application:android]=306
  [application:other]=399

  [games:PC]=401
  [games:mac]=402
  [games:psx]=403
  [games:xbox360]=404
  [games:wii]=405
  [games:handheld]=406
  [games:IOS]=407
  [games:android]=408
  [games:other]=499

  [other:ebooks]=601
  [other:comics]=602
  [other:pictures]=603
  [other:covers]=604
  [other:physibles]=605
  [other:other]=699
)

# Display only subcategories for selection
selection=$(printf "%s\n" "${!categories[@]}" | sort | fzf --prompt="Select subcategory: ")

if [ -z "$selection" ]; then
  echo "No selection made."
  exit 1
fi

# Output selected key and ID
echo "You selected: $selection (ID: ${categories[$selection]})"

# link=$(xh POST https://apibay.org/q.php cat==401 q=="$search" | jq -r '.[] | "\(.seeders) \(.name) magnet:?xt=urn:btih:\(.info_hash)"' | fzf --no-sort | awk '{print $4}')
link=$(xh POST https://apibay.org/q.php cat=${categories[$selection]} q=="$search" | jq -r '.[] | "\(.seeders) \(.name) magnet:?xt=urn:btih:\(.info_hash)"' | fzf --no-sort | awk '{print $NF}')
echo $link
cd /mnt/c/Users/Stiwie/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/WebTorrent && powershell.exe -c "./WebTorrent.lnk $link"
