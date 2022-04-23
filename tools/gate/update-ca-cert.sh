#!/bin/bash

set -xe

# copy ca
cp -f tls/CAs/*.crt /usr/local/share/ca-certificates/

# update ca
update-ca-certificates
