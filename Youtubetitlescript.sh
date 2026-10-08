#!/usr/bin/env bash

read -p "Please insert URLs : " CHANNEL_URL

if [ -z "$CHANNEL_URL" ]; then
echo "URL was not computed, terminate the session"
exit 1

fi

OUTPUT_FILE="titles.txt"

echo "Processing: $CHANNEL_URL"
yt-dlp --flat-playlist --print "%(title)s" -q --no-warnings -i "$CHANNEL_URL" > "$OUTPUT_FILE"

if [ $? -eq 0 ] && [ -s "$OUTPUT_FILE" ]; then
COUNT=$(wc -l < "$OUTPUT_FILE")
echo "Completed. Total : $COUNT in $OUTPUT_FILE saved"
else
echo "error occured: problem occured when processing $CHANNEL_URL"

exit 1
fi
