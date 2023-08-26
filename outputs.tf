output "groups" {
  description = "Identity Store groups."
  value       = aws_identitystore_group.display_name
}

output "users" {
  description = "Identity Store users."
  value       = aws_identitystore_user.username
}
