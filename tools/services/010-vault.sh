#!/bin/bash

# TODO: check if enabled
# if yes, install

set -xe

# add vault
helm upgrade -i vault vault \
  --repo https://helm.releases.hashicorp.com \
  --namespace vault \
  --create-namespace \
  --reuse-values \
  --set global.tlsDisable=false \
  --set injector.metrics.enabled=true \
  --set server.ingress.enabled=true \
  --set server.ingress.hosts[0].host=vault.${OSH_FQDN} \
  --set server.ingress.hosts[0].paths[0]=/ \
  --set server.ingress.tls[0].secretName=vault-tls \
  --set server.ingress.tls[0].hosts[0]=vault.${OSH_FQDN} \
  --set server.auditStorage.enabled=true \
  --set server.standalone.config="ui = true
listener 'tcp' {
  tls_disable = 0
address = '[::]:8200'
cluster_address = '[::]:8201'
}
storage 'file' {
  path = '/vault/data'
}"

# add certificate
envsubst < manifests/vault/certificate.yaml | kubectl apply -f -
