# To list SSH secrets paths
path "ssh/*" {
  capabilities = [ "list" ]
}

# To use the configured SSH secrets engine otp_key_role role
path "ssh/creds/default" {
  capabilities = ["create", "read", "update"]
}
