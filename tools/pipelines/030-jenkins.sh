#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

# add jenkins
helm upgrade -i jenkins jenkins \
  --repo https://charts.jenkins.io \
  --namespace pipelines \
  --create-namespace \
  --reuse-values \
  --set controller.ingress.enabled=true \
  --set controller.ingress.apiVersion=networking.k8s.io/v1 \
  --set controller.ingress.hostName=jenkins.${OSH_FQDN} \
  --set controller.ingress.tls[0].secretName=jenkins-tls \
  --set controller.ingress.tls[0].hosts[0]=jenkins.${OSH_FQDN} \
  --set serviceAccountAgent.create=true \
  --set backup.enabled=true

# add certificate
envsubst < manifests/jenkins/certificate.yaml | kubectl apply -f -
