#!/bin/bash

set -xe

# generate etcd defaults
envsubst < conf/etc/default/etcd > /etc/default/etcd
systemctl restart etcd
