#!/bin/bash
# ==========================================
# WIBU TUNNELING - wibu-utils.sh
# Core functions for Zero-Downtime Xray API
# ==========================================

CONFIG_FILE="/usr/local/etc/xray/config.json"

xray_api_add() {
    local tag=$1
    local json_data=$2
    xray api addu "$tag" <<< "$json_data" >/dev/null 2>&1
}

xray_api_rm() {
    local tag=$1
    local email=$2
    xray api rmu "$tag" <<< "{\"email\":\"$email\"}" >/dev/null 2>&1
}

xray_add_vless() {
    local uuid=$1
    local user=$2
    # 1. Tambah ke config.json (persistent)
    local TMP_CFG=$(mktemp /tmp/xray.XXXXXX.json)
    jq --arg uuid "$uuid" --arg user "$user" '
        (.inbounds[] | select(.tag == "vless-ws-tls").settings.clients) += [{"id": $uuid, "email": $user}] |
        (.inbounds[] | select(.tag == "vless-ws-ntls").settings.clients) += [{"id": $uuid, "email": $user}] |
        (.inbounds[] | select(.tag == "vless-grpc").settings.clients) += [{"id": $uuid, "email": $user}]
    ' "$CONFIG_FILE" > "$TMP_CFG"
    if jq empty "$TMP_CFG" >/dev/null 2>&1; then mv "$TMP_CFG" "$CONFIG_FILE"; fi

    # 2. Inject via gRPC API (Zero Downtime)
    local client_json="{\"id\":\"$uuid\",\"email\":\"$user\"}"
    xray_api_add "vless-ws-tls" "$client_json"
    xray_api_add "vless-ws-ntls" "$client_json"
    xray_api_add "vless-grpc" "$client_json"
}

xray_add_vmess() {
    local uuid=$1
    local user=$2
    local TMP_CFG=$(mktemp /tmp/xray.XXXXXX.json)
    jq --arg uuid "$uuid" --arg user "$user" '
        (.inbounds[] | select(.tag == "vmess-ws-tls").settings.clients) += [{"id": $uuid, "alterId": 0, "email": $user}] |
        (.inbounds[] | select(.tag == "vmess-ws-ntls").settings.clients) += [{"id": $uuid, "alterId": 0, "email": $user}] |
        (.inbounds[] | select(.tag == "vmess-grpc").settings.clients) += [{"id": $uuid, "alterId": 0, "email": $user}]
    ' "$CONFIG_FILE" > "$TMP_CFG"
    if jq empty "$TMP_CFG" >/dev/null 2>&1; then mv "$TMP_CFG" "$CONFIG_FILE"; fi

    local client_json="{\"id\":\"$uuid\",\"alterId\":0,\"email\":\"$user\"}"
    xray_api_add "vmess-ws-tls" "$client_json"
    xray_api_add "vmess-ws-ntls" "$client_json"
    xray_api_add "vmess-grpc" "$client_json"
}

xray_add_trojan() {
    local uuid=$1
    local user=$2
    local TMP_CFG=$(mktemp /tmp/xray.XXXXXX.json)
    jq --arg uuid "$uuid" --arg user "$user" '
        (.inbounds[] | select(.tag == "trojan-ws-tls").settings.clients) += [{"password": $uuid, "email": $user}] |
        (.inbounds[] | select(.tag == "trojan-grpc").settings.clients) += [{"password": $uuid, "email": $user}]
    ' "$CONFIG_FILE" > "$TMP_CFG"
    if jq empty "$TMP_CFG" >/dev/null 2>&1; then mv "$TMP_CFG" "$CONFIG_FILE"; fi

    local client_json="{\"password\":\"$uuid\",\"email\":\"$user\"}"
    xray_api_add "trojan-ws-tls" "$client_json"
    xray_api_add "trojan-grpc" "$client_json"
}

xray_del_user() {
    local user=$1
    local TMP_CFG=$(mktemp /tmp/xray.XXXXXX.json)
    jq --arg u "$user" '
        (.inbounds[] | select(.settings.clients != null) | .settings.clients) |= map(select(.email != $u)) |
        (.routing.rules[] | select(.user != null and .outboundTag == "blocked") | .user) |= map(select(. != $u))
    ' "$CONFIG_FILE" > "$TMP_CFG"
    if jq empty "$TMP_CFG" >/dev/null 2>&1; then mv "$TMP_CFG" "$CONFIG_FILE"; fi

    # Remove via gRPC API from all inbounds (ignores error if not found)
    for tag in "vless-ws-tls" "vless-ws-ntls" "vless-grpc" "vmess-ws-tls" "vmess-ws-ntls" "vmess-grpc" "trojan-ws-tls" "trojan-grpc"; do
        xray_api_rm "$tag" "$user"
    done
}

xray_lock_user() {
    local user=$1
    local TMP_CFG=$(mktemp /tmp/xray.XXXXXX.json)
    jq --arg u "$user" '(.routing.rules[] | select(.user != null and .outboundTag == "blocked") | .user) |= (. + [$u] | unique)' "$CONFIG_FILE" > "$TMP_CFG"
    if jq empty "$TMP_CFG" >/dev/null 2>&1; then mv "$TMP_CFG" "$CONFIG_FILE"; fi
    
    # Reload policy (API doesn't support changing routing on the fly, but we can temporarily remove the user from API to lock them instantly)
    # Actually, API only supports adding/removing users from inbounds. Removing them blocks them immediately.
    # To fully mimic lock, we remove them via API. When they are unlocked, we must add them back.
    # But wait, without knowing their UUID/Protocol, we can't add them back easily via API without reading config.
    # So for lock/unlock, systemctl reload or restart might still be needed if we want it perfect,
    # OR we just restart xray for lock/unlock since it's a rare action compared to create/renew.
    # We will use systemctl restart xray for now for lock/unlock, or just let cron do it.
    systemctl restart xray >/dev/null 2>&1
}

xray_unlock_user() {
    local user=$1
    local TMP_CFG=$(mktemp /tmp/xray.XXXXXX.json)
    jq --arg u "$user" '(.routing.rules[] | select(.user != null and .outboundTag == "blocked") | .user) |= map(select(. != $u))' "$CONFIG_FILE" > "$TMP_CFG"
    if jq empty "$TMP_CFG" >/dev/null 2>&1; then mv "$TMP_CFG" "$CONFIG_FILE"; fi
    systemctl restart xray >/dev/null 2>&1
}
