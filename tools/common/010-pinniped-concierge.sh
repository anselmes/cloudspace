#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# install pinnped concierge
kubectl delete -f https://get.pinniped.dev/v0.12.0/install-pinniped-concierge-crds.yaml
kubectl delete -f https://get.pinniped.dev/v0.12.0/install-pinniped-concierge.yaml
