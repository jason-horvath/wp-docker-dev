#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

set -e

# .env should be two levels up
source "$DIR/../../.env"

# Ensure we trim whitespace around the domain if present
DOMAIN="$(echo "$DOMAIN" | xargs)"

# Use a grep pattern to allow for variations in whitespace
if grep -qE "127\.0\.0\.1\s+\b${DOMAIN}\b" /etc/hosts; then
    echo "Entry for ${DOMAIN} already exists in /etc/hosts."
else
    echo "Adding new entry for ${DOMAIN} to /etc/hosts."
    # Using 'sh -c' to handle redirection with sudo
    sudo -- sh -c -e "echo '127.0.0.1\t${DOMAIN}' >> /etc/hosts"
    cat /etc/hosts
fi

