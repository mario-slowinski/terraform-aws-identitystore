resource "aws_identitystore_group_membership" "group_member" {
  for_each = {
    for group_membership in local.group_memberships :
    "${group_membership.group}:${group_membership.member}" => group_membership
  }

  identity_store_id = var.identity_store_id
  group_id          = aws_identitystore_group.display_name[each.value.group].group_id
  member_id         = aws_identitystore_user.username[each.value.member].user_id
}
