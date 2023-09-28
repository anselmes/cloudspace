#!/bin/bash

set -xe

# add vault cluster-issuer
envsubst <manifests/certmanager/cluster-issuer-vault.yaml | kubectl apply -f -
