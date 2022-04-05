#!/bin/bash

# TODO: check if already installed
# if not, install

set -xe

# fetch repo
cd /tmp
git clone https://github.com/kubernetes-csi/csi-driver-host-path.git
cd csi-driver-host-path

# add driver and storage class
deploy/kubernetes-latest/deploy.sh
kubectl apply -f examples/csi-storageclass.yaml

# TODO: fix - snapshot class not deployed
kubectl apply -f deploy/kubernetes-1.21/hostpath/csi-hostpath-snapshotclass.yaml

# TODO: set default storage class
# - check if hostpath storage class
# - check if default storage class
# - if default storage class, is it hostpath
# - if default storage class is hostpath, remove it and set to csi-hostpath-sc
kubectl annotate sc hostpath storageclass.kubernetes.io/is-default-class=false --overwrite
kubectl annotate sc csi-hostpath-sc storageclass.kubernetes.io/is-default-class=true --overwrite
