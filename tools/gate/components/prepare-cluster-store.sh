#!/bin/bash

set -xe

# TODO: choice betwen token and approle - default: token

ROLE_NAME=external-secrets
TOKEN_POLICY_NAMES=secret-read

# create vault approle role
#tools/components/020-vault-approle.sh write_approle_role ${ROLE_NAME} ${TOKEN_POLICY_NAMES}

# export vault approle role-id
#tools/components/020-vault-approle.sh read_approle_role ${ROLE_NAME}


# export vault approle secret-id
#tools/components/020-vault-approle.sh read_approle_secret_id ${ROLE_NAME}

RESULT=$(vault token create -policy=default -policy=${TOKEN_POLICY_NAMES} | awk '/token/ { print $2 }')
export VAULT_TOKEN=$(echo $RESULT | sed '1p;d')
