#!/bin/bash

# TODO: check if enabled
# if yes, install

set -xe

# add kasten
helm upgrade -i k10 k10 \
  --repo https://charts.kasten.io \
  --reuse-values \
  --create-namespace \
  --namespace kasten-io \
  --set ingress.create=true \
  --set ingress.tls.enabled=true \
  --set ingress.tls.secretName=kasten-tls \
  --set ingress.class=istio \ # TODO: fix - add only if istio is present or enabled
  --set ingress.host=kasten.${OSH_FQDN} \
  --set eula.accept=true \
  --set eula.company=${KASTEN_EULA_COMPANY} \
  --set eula.email=${KASTEN_EULA_EMAIL} \
  --set prometheus.networkPolicy.enabled=false \
  --set prometheus.server.enabled=false \
  --set prometheus.serviceAccounts.server.create=false \
  --set auth.tokenAuth.enabled=true \
  --set grafana.enabled=false \
  --set vault.secretName=k10-cluster-passphrase \
  --set vault.address=https://vault.vault.svc.cluster.local:8200 # TODO: fix - internal url if vault present | include if enabled

# TODO: fix - create vault secret if approle
# envsubst < manifests/kasten/secret.yaml | kubectl apply -f -

# create certificate
envsubst < manifests/kasten/certificate.yaml | kubectl apply -f -
