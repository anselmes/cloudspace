#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# create namespaces
kubectl apply -f manifests/istio/namespaces.yaml

# deploy istio operator
kubectl apply -f manifests/istio/operator.yaml

# deploy istio
sleep 30
kubectl apply -f manifests/istio/istio.yaml

sleep 15
kubectl annotate svc -n istio-system istio-ingressgateway metallb.universe.tf/allow-shared-ip=default-ingress-ip --overwrite
