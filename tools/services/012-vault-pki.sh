#!/bin/bash

# TODO: check if already present
# if not, add

set -xe

# enable pki
vault secrets enable pki

# tune pki
vault secrets tune -max-lease-ttl=87600h pki

# TODO: load cert if present
# if not, generate
# import intermediate ca
vault write pki/config/ca pem_bundle=@vault/tls/intermediate.ca.pem

# configure ca
vault write pki/config/urls \
  issuing_certificates="$VAULT_ADDR/v1/pki/ca" \
  crl_distribution_points="$VAULT_ADDR/v1/pki/crl" \
  ocsp_servers="$VAULT_ADDR/v1/pki/ocsp"

# create role
vault write pki/roles/default \
  enforce_hostnames="false" \
  allow_bare_domains="true" \
  allow_subdomains="true" \
  allow_glob_domains="true" \
  code_signing_flag="true" \
  email_protection_flag="true" \
  generate_lease="true" \
  max_ttl="720h"

# create policies
vault policy write pki-admin vault/policy/pki-admin.hcl
