#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# create cloudflare api token secret
envsubst < manifests/externaldns/cloudflare-api-token.yaml | kubectl apply -f -

# TODO: provider choice: cloudflare|infoblox|rfc2136
# deploy external-dns
helm upgrade -i external-dns-cf external-dns \
  --repo https://charts.bitnami.com/bitnami \
  --namespace kube-system \
  --reuse-values \
  --set crd.create=true \ # TODO: only include if not already present
  --set provider=cloudflare \
  --set combineFQDNAnnotation=true \
  --set cloudflare.secretName=cloudflare-api-token \
  --set cloudflare.proxied=false \
  --set sources="{crd,service,ingress,istio-gateway,istio-virtualservice}" \ # TODO: only include igw & ivs if istio is present
  --set txtOwnerId=cloudflare \
  --set txtPrefix=cf- \
  --set policy=sync \
  --set metrics.enabled=true
