#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

: ${NEXUS_NAMESPACE:=clos-pipelines}

# add nexus
helm upgrade -i nexus nexus-repository-manager \
  --repo https://sonatype.github.io/helm3-charts \
  --namespace ${NEXUS_NAMESPACE} \
  --create-namespace \
  --set nexus.docker.enabled=true \
  --set ingress.enabled=true \
  --set ingress.hostRepo=nexus.${OSH_FQDN} \
  --set ingress.tls[0].secretName=nexus-tls \
  --set ingress.tls[0].hosts[0]=nexus.${OSH_FQDN}

# create certificate
cat <<-eof | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: nexus-cert
  namespace: ${NEXUS_NAMESPACE}
spec:
  secretName: nexus-tls
  commonName: nexus.${OSH_FQDN}
  dnsNames:
    - nexus.${OSH_FQDN}
  issuerRef:
    kind: ClusterIssuer
    name: cloudflare
eof
