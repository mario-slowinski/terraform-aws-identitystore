locals {
  group_memberships = distinct(flatten([
    for group in var.groups : [
      for member in group.members : {
        group  = group.display_name
        member = member
      }
    ]
    if group.members != null
  ]))
}
