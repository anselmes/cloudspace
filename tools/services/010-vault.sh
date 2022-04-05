#!/bin/bash

# TODO: check if enabled
# if yes, install

set -xe

: ${VAULT_NAMESPACE:=clos-infra}

# add vault
helm upgrade -i vault vault \
  --repo https://helm.releases.hashicorp.com \
  --namespace ${VAULT_NAMESPACE} \
  --create-namespace \
  --reuse-values \
  --set injector.metrics.enabled=true \
  --set server.ingress.enabled=true \
  --set server.ingress.hosts[0].host=vault.${OSH_FQDN} \
  --set server.ingress.hosts[0].paths[0]=/ \
  --set server.ingress.tls[0].secretName=vault-tls \
  --set server.ingress.tls[0].hosts[0]=vault.${OSH_FQDN} \
  --set server.auditStorage.enabled=true

# add certificate
cat <<-eof | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: vault-cert
  namespace: ${VAULT_NAMESPACE}
spec:
  secretName: vault-tls
  commonName: vault.${OSH_FQDN}
  dnsNames:
    - vault.${OSH_FQDN}
  issuerRef:
    kind: ClusterIssuer
    name: cloudflare
eof
