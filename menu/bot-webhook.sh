#!/bin/bash
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Parse HTTP Headers from STDIN (provided by systemd socket)
while IFS= read -r line; do
    line="${line%$'\r'}"
    [[ -z "$line" ]] && break
    if [[ "$line" =~ ^Content-Length:\ (.*) ]]; then
        CONTENT_LENGTH="${BASH_REMATCH[1]}"
    fi
done

payload=""
if [[ -n "$CONTENT_LENGTH" ]]; then
    read -n "$CONTENT_LENGTH" payload
fi

# Send 200 OK back to Telegram instantly
echo -en "HTTP/1.1 200 OK\r\nConnection: close\r\nContent-Type: application/json\r\n\r\n{}"

# Run bot core logic in background and redirect output to prevent locking
if [[ -n "$payload" ]]; then
    /usr/local/bin/bot-daemon "$payload" >/dev/null 2>&1 &
fi
