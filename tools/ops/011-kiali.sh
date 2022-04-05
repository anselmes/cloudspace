#!/bin/bash

# TODO: add cr if enabled - default: true

set -xe

# deploy kiali
envsubst < manifests/kiali/kiali.yaml | kubectl apply -f -

# create ingress
envsubst < manifests/kiali/certificate.yaml | kubectl apply -f -
envsubst < manifests/kiali/ingress.yaml | kubectl apply -f -
