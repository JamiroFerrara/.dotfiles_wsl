#!/bin/bash

sudo rm temp/htt*

sudo inotifywait -m -e modify --format '%w%f' temp/capture.pcap | while read FILE; do
    filename="temp/capture.pcap"

    # Extract unique URLs from the pcap file
    urls=$(tshark -r "$filename" -T fields -e http.request.full_uri 2>/dev/null | sort -u)

    # Loop through each URL
    while IFS= read -r selected_url; do
        if [ -n "$selected_url" ]; then
            echo "Selected URL: $selected_url"

            # Create a file with the URL name
            output_file="${selected_url//\//-}.json"
            touch "temp/$output_file"

            # Extract response body for the selected URL and write to the file
            for stream in $(tshark -r "$filename" -Y "http.request.full_uri == \"$selected_url\"" -T fields -e tcp.stream | sort -n | uniq); do
                tshark -q -r "$filename" -z follow,http,ascii,$stream -T fields -e ip.id -e http.file_data -Y "http.request.full_uri == \"$selected_url\""  | awk '/{/,/}/' | jq > "temp/$output_file"
            done
        else
            echo "No URL selected."
        fi
    done <<< "$urls"
done
