#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

# add gitea
helm upgrade -i gitea gitea --repo https://dl.gitea.io/charts \
  --namespace pipelines \
  --create-namespace \
  --reuse-values \
  --set ingress.enabled=true \
  --set ingress.hosts[0].host=gitea.${OSH_FQDN} \
  --set ingress.hosts[0].paths[0].path=/ \
  --set ingress.hosts[0].paths[0].pathType=Prefix \
  --set ingress.tls[0].secretName=gitea-tls \
  --set ingress.tls[0].hosts[0]=gitea.${OSH_FQDN} \
  --set signing.enabled=true \
  --set gitea.admin.username=gitea \
  --set gitea.admin.password=${GITEA_ADMIN_PASSWORD} \
  --set gitea.admin.email=${GITEA_ADMIN_EMAIL} \
  --set gitea.metrics.enabled=true \
  --set service.ssh.type=LoadBalancer \
  --set service.DISABLE_REGISTRATION=true \
  --set gitea.config.APP_NAME=${GITEA_APP_NAME} \
  --set gitea.config.RUN_MODE=prod \
  --set gitea.config.server.ROOT_URL=https://gitea.${OSH_FQDN}

# add certificate
envsubst < manifests/gitea/certificate.yaml | kubectl apply -f -

# annotate ssh service
kubectl annotate svc -n pipelines gitea-ssh external-dns.alpha.kubernetes.io/hostname=git.${OSH_FQDN} --overwrite
kubectl annotate svc -n pipelines gitea-ssh metallb.universe.tf/allow-shared-ip=default-ingress-ip --overwrite
