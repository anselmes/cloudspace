#!/bin/bash

set -xe

# TODO: merge with prepare-cluster-store, rename and call from
# vault-cluster-store and vault-cluster-issuer

ROLE_NAME=cert-manager
TOKEN_POLICY_NAMES=pki-admin

# create vault approle role
#tools/components/020-vault-approle.sh write_approle_role ${ROLE_NAME} ${TOKEN_POLICY_NAMES}

# export vault approle role-id
#tools/components/020-vault-approle.sh read_approle_role ${ROLE_NAME}

# export vault approle secret-id
#tools/components/020-vault-approle.sh read_approle_secret_id ${ROLE_NAME}

RESULT=$(vault token create -policy=default -policy=${TOKEN_POLICY_NAMES} | awk '/token/ { print $2 }')
export VAULT_TOKEN=$(echo $RESULT | sed '1p;d')
