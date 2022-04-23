#!/bin/bash

# TODO: check if already present
# if not, add

set -xe

# enable approle
vault auth enable approle

# create policies
vault policy write approle-admin vault/policy/approle-admin.hcl
