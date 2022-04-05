# Write and manage secrets in key-value secrets engine
# The 'patch' capability is new in Vault 1.9
#path "secret*" {
#  capabilities = [ "create", "read", "update", "delete", "list", "patch" ]
#}
#
# To enable secrets engines
#path "sys/mounts/*" {
#  capabilities = [ "create", "read", "update", "delete" ]
#}

# Enable key/value secrets engine at the secret path
path "sys/mounts/secret" {
  capabilities = [ "update" ]
}

# To list the available secrets engines
path "sys/mounts" {
  capabilities = [ "read" ]
}

# Write and manage secrets in key/value secrets engine
path "secret/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Create policies to permit apps to read secrets
path "sys/policies/acl/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# Create tokens for verification & test
path "auth/token/create" {
  capabilities = [ "create", "update", "sudo" ]
}
