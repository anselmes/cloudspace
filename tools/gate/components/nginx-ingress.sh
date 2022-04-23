#!/bin/bash

# deploy nginx ingress controller
helm upgrade -i nginx nginx-ingress \
  --repo https://helm.nginx.com/stable \
  --namespace kube-system \
  --set controller.appprotect.enable=true \
  --set controller.appprotectdos.enable=true \
  --set controller.replicaCount=1 \
  --set controllersetAsDefaultIngress=true \
  --set controller.enableOIDC=true \
  --set controller.enableTLSPassthrough=true \
  --set controller.enableCertManager=true \
  --set controller.globalConfiguration.create=true \
  --set controller.enableLatencyMetrics=true
