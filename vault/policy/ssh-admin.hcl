# To enable secrets engines
path "sys/mounts/*" {
  capabilities = [ "create", "read", "update", "delete" ]
}

# To configure the SSH secrets engine
path "ssh/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}

# To enable the userpass auth method
path "sys/auth/userpass" {
  capabilities = [ "update" ]
}

# To create the policy for the default user
path "sys/policies/acl/ssh-user" {
  capabilities = [ "read", "update" ]
}

# To create the default user
path "auth/userpass/users/*" {
  capabilities = [ "create", "update" ]
}
