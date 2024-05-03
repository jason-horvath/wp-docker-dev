#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

set -e

# .env should be two levels up
source "$DIR/../../.env"

DOMAIN=$(echo "$DOMAIN")

# Directory where the certificates will be stored
cert_dir="$DIR/../certs"

# Create the certificate directory if it does not exist
mkdir -p "$cert_dir"

# Generate certificates only if they don't already exist
if [[ ! -f "$cert_dir/$DOMAIN.pem" || ! -f "$cert_dir/$DOMAIN-key.pem" ]]; then
    mkcert "$DOMAIN"
    # Move the generated certificates to the specified directory
    mv "$DOMAIN.pem" "$cert_dir/"
    mv "$DOMAIN-key.pem" "$cert_dir/"
else
    echo "Certificates for $DOMAIN already exist, delele them to acquire new ones."
fi
