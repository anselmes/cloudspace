#!/bin/bash

# TODO: check if already present
# if not, add

set -xe

# list secrets
vault secrets list -detailed

# create policies
vault policy write secret-admin vault/policy/secret-admin.hcl
vault policy write secret-read vault/policy/secret-read.hcl
