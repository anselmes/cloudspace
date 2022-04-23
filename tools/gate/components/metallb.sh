#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# FIXME: see what changes would be made, returns nonzero returncode if different
#kubectl get configmap kube-proxy -n kube-system -o yaml | \
#sed -e "s/strictARP: false/strictARP: true/" | \
#kubectl diff -f - -n kube-system

# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

# deploy metallb
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml

# create config
# cat <<-eof | kubectl apply -f -
# apiVersion: v1
# kind: ConfigMap
# metadata:
#   namespace: metallb-system
#   name: config
# data:
#   config: |
#     address-pools:
#       - name: default
#         protocol: layer2
#         addresses:
#           - ${METALLB_ADDRESS_RANGE}
# eof

# deploy with helm
# TODO: add layer2 or bgp choice
helm upgrade -i metallb metallb \
  --repo https://metallb.github.io/metallb \
  --namespace metallb-system \
  --create-namespace \
  --set configInline.address-pools[0].name=default \
  --set configInline.address-pools[0].protocol=layer2 \
  --set configInline.address-pools[0].addresses[0]=${METALLB_ADDRESS_RANGE}
