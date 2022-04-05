#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# deploy external-secrets
helm upgrade -i external-secrets external-secrets \
  --repo https://charts.external-secrets.io \
  --namespace kube-system \
  --reuse-values \
  --set installCRDs=true # TODO: include crd only if not already present
