#!/bin/bash

# deploy nginx ingress controller
helm upgrade -i nginx-ingress nginx-ingress \
  --repo https://helm.nginx.com/stable \
  --reuse-values \
  --namespace kube-system \
  --set controller.replicaCount=2 \
  --set controllersetAsDefaultIngress=true \
  --set controller.enableOIDC=true \
  --set controller.enableTLSPassthrough=true \
  --set controller.enableCertManager=true \
  --set controller.globalConfiguration.create=true \
  --set controller.enableLatencyMetrics=true
