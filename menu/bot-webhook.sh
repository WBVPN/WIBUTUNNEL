#!/bin/bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

shopt -s nocasematch
while IFS= read -r line; do
    line="${line%$'\r'}"
    echo "HEADER: $line" >> /tmp/webhook_headers.log
    [[ -z "$line" ]] && break
    if [[ "$line" =~ ^content-length:\ *([0-9]+) ]]; then
        CONTENT_LENGTH="${BASH_REMATCH[1]}"
    fi
done
shopt -u nocasematch

payload=""
if [[ -n "$CONTENT_LENGTH" ]]; then
    payload=$(head -c "$CONTENT_LENGTH")
fi
echo "PAYLOAD: $payload" >> /tmp/webhook_payload.log

echo -en "HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Type: application/json\r\n\r\n{}"

if [[ -n "$payload" ]]; then
    /usr/local/bin/bot-daemon "$payload" >/tmp/bot_daemon_error.log 2>&1 &
fi
