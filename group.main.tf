resource "aws_identitystore_group" "display_name" {
  for_each = {
    for group in var.groups :
    group.display_name => group
    if group.display_name != null
  }

  identity_store_id = var.identity_store_id
  display_name      = each.value.display_name
  description       = each.value.description
}
