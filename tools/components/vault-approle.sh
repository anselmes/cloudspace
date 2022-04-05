#!/bin/bash

set -xe

# FIXME: fix and test

function write_approle_role() {
  vault write auth/approle/role/$1 \
    token_policies=default,$2 \
    token_ttl=1h \
    token_max_ttl=4h \
    token_num_uses=0
}

function read_approle_role() {
  export VAULT_APPROLE_ID=$(vault read auth/approle/role/$1/role-id | awk '/role_id/ { print $2 }')
}

function write_approle_secret_id() {
  vault write -f auth/approle/role/$1/secret-id

  RESULT=$(vault write -f auth/approle/role/$1/secret-id | awk '/secret_id/ { print $2 }')
  sleep 0.1

  export VAULT_SECRET_ID=$(echo $RESULT | sed '1p;d')
  export VAULT_SECRET_ID_ACCESSOR=$(echo $RESULT | sed '2p;d')
}
