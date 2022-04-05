#!/bin/bash

set -xe

# TODO: check if snapshot class crd and controller already exists
# if crd and not controller, deploy only controller
# if not deploy both
# Change to the latest supported snapshotter version

CURRENT_DIR=$(pwd)

# feth repo
cd /tmp
[ !-d /tmp/external-snapshotter ] && git clone https://github.com/kubernetes-csi/external-snapshotter.git

cd external-snapshotter

# add crd
kustomize build client/config/crd | kubectl apply -f -

# add controller
kustomize build deploy/kubernetes/snapshot-controller | kubectl apply -n kube-system -f -

cd ${CURRENT_DIR}
