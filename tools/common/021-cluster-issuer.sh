#!/bin/bash

set -xe

# TODO: check if cloudflare enabled
# if not, only add self-signed
# if yes, add both

# add self-signed cluster-issuer
kubectl apply -f manifests/certmanager/cluster-issuer-self-signed.yaml

# add cloudflare cluster-issuer
envsubst <manifests/certmanager/cluster-issuer-cloudflare.yaml | kubectl apply -f -
