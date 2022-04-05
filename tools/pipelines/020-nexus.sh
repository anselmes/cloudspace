#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

# add nexus
helm upgrade -i nexus nexus-repository-manager \
  --repo https://sonatype.github.io/helm3-charts \
  --namespace pipelines \
  --create-namespace \
  --set nexus.docker.enabled=true \
  --set ingress.enabled=true \
  --set ingress.ingressClassName=null \
  --set ingress.hostRepo=nexus.${OSH_FQDN} \
  --set ingress.tls[0].secretName=nexus-tls \
  --set ingress.tls[0].hosts[0]=nexus.${OSH_FQDN}

# create certificate
envsubst < manifests/nexus/certificate.yaml | kubectl apply -f -
