# Write and manage secrets in key-value secrets engine
# The 'patch' capability is new in Vault 1.9
path "secret*" {
  capabilities = [ "create", "read", "update", "delete", "list", "patch" ]
}

# To enable secrets engines
path "sys/mounts/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}
