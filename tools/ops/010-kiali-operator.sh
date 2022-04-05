#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

# FIXME: remove cr
# install kiali operator
helm upgrade -i kiali-operator kiali-operator \
  --repo https://kiali.org/helm-charts \
  --namespace clos-lma \
  --create-namespace \
  --reuse-values \
  --set cr.create=true \
  --set cr.namespace=istio-system
