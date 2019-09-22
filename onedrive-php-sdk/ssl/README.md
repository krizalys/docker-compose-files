SSL
===

This folder contains a self-signed certificate valid for more than 5000 years.
Not suited for production.

Regenerating the certificate
----------------------------

```sh
CERT_C='XX'
CERT_ST='XX'
CERT_L=''
CERT_O=''
CERT_OU=''
CERT_CN='default'

KEY_PATH='/tmp/nginx.key'
CERT_PATH='/tmp/nginx.crt'

# The following certificate is valid for 2 million days, or ~5479 years.
openssl req            \
  -nodes               \
  -x509                \
  -out    "$CERT_PATH" \
  -newkey rsa:2048     \
  -keyout "$KEY_PATH"  \
  -days   2000000      \
  -subj "/C=$CERT_C/ST=$CERT_ST/L=$CERT_L/O=$CERT_O/OU=$CERT_OU/CN=$CERT_CN"
```
