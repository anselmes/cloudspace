#!/bin/bash

set -xe

: ${SELF_SIGNED:=true}

# install etcd
apt install -y etcd

# generate self-signed certs
if [[ -z ${SELF_SIGNED} ]]; then
  # FIXME: generate self-signed certs

  mkdir -p /etc/pki/etcd
  cp -f tls/ca.etcd.* /etc/pki/etcd
  chown -R etcd:etcd /etc/pki/etcd

  systemctl restart etcd
fi

# restart etcd
mkdir -p /var/lib/etcd
chown etcd:etcd /var/lib/etcd
