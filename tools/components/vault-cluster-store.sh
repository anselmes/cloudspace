#!/bin/bash

set -xe

# add vault cluster store
envsubst <manifests/externalsecrets/vault.yaml | kubectl apply -f -
