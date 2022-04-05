#!/bin/bash

# TODO: check if enabled
# if yes, install

set -xe

: ${KASTEN_NAMESPACE:=clos-infra}
: ${VAULT_NAMESPACE:=clos-infra}

# FIXME: add only if istio is present or enabled
# FIXME: internal url if vault present | include if enabled
# add kasten
helm upgrade -i k10 k10 \
  --repo https://charts.kasten.io \
  --reuse-values \
  --namespace ${KASTEN_NAMESPACE} \
  --create-namespace \
  --set ingress.create=true \
  --set ingress.tls.enabled=true \
  --set ingress.tls.secretName=kasten-tls \
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
  --set vault.address=http://vault.${VAULT_NAMESPACE}.svc.cluster.local:8200

# FIXME: create vault secret if approle
# cat <<-eof | kubectl apply -f -
# apiVersion: v1
# kind: Secret
# metadata:
#   name: k10-cluster-passphrase
#   namespace: ${KASTEN_NAMESPACE}
# stringData:
#   vaulttransitkeyname: kasten
#   vaulttransitpath: ${VAULT_TRANSIT_PATH}
# ---
# apiVersion: v1
# kind: Secret
# metadata:
#   name: vault-creds
#   namespace: ${KASTEN_NAMESPACE}
# stringData:
#   vault_token: ${VAULT_TOKEN}
# eof

# create certificate
cat <<-eof | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: kasten-cert
  namespace: ${KASTEN_NAMESPACE}
spec:
  secretName: kasten-tls
  commonName: kasten.${OSH_FQDN}
  dnsNames:
    - kasten.${OSH_FQDN}
  issuerRef:
    kind: ClusterIssuer
    name: cloudflare
eof
