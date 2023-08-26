resource "aws_identitystore_group_membership" "display_name" {
  for_each = {
    for group_membership in local.group_memberships :
    group_membership.group => group_membership.member
  }

  identity_store_id = var.identity_store_id
  group_id          = aws_identitystore_group.display_name[each.key].group_id
  member_id         = aws_identitystore_user.username[each.value].user_id
}
