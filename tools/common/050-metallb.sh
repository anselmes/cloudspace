#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# TODO: fix - see what changes would be made, returns nonzero returncode if different
#kubectl get configmap kube-proxy -n kube-system -o yaml | \
#sed -e "s/strictARP: false/strictARP: true/" | \
#kubectl diff -f - -n kube-system

# actually apply the changes, returns nonzero returncode on errors only
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

# deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.12.1/manifests/metallb.yaml

# create config
envsubst < manifests/metallb/config.yaml | kubectl apply -f -
