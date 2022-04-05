#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

: ${JENKINS_NAMESPACE:=clos-pipelines}

# add jenkins
helm upgrade -i jenkins jenkins \
  --repo https://charts.jenkins.io \
  --namespace ${JENKINS_NAMESPACE} \
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
cat <<-eof | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: jenkins-cert
  namespace: ${JENKINS_NAMESPACE}
spec:
  secretName: jenkins-tls
  commonName: jenkins.${OSH_FQDN}
  dnsNames:
    - jenkins.${OSH_FQDN}
  issuerRef:
    kind: ClusterIssuer
    name: cloudflare
eof
