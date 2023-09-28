#!/bin/bash

# TODO: check if already present
# if not, add

set -xe

# enable ssh
vault secrets enable ssh

# enable userpass
vault auth enable userpass

# FIXME: add ca
# check default; if none, set to ca
# create otp role
vault write ssh/roles/default \
  key_type=otp \
  default_user=admin \
  cidr_list=0.0.0.0/0

# create policies
vault policy write ssh-admin vault/policy/ssh-admin.hcl
vault policy write ssh-user vault/policy/ssh-user.hcl
