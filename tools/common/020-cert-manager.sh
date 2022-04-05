#!/bin/bash

set -xe

# TODO: check if already installed
# if not, install

# deploy cert-manager using krew
kubectl cert-manager experimental install -n cert-manager
