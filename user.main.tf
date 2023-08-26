resource "aws_identitystore_user" "username" {
  for_each = {
    for user in var.users :
    user.user_name => user
    if user.user_name != null
  }

  display_name       = coalesce(each.value.display_name, join(" ", [each.value.name.given_name, each.value.name.family_name]))
  identity_store_id  = var.identity_store_id
  user_name          = each.value.user_name
  locale             = each.value.locale
  nickname           = each.value.nickname
  preferred_language = each.value.preferred_language
  profile_url        = each.value.profile_url
  timezone           = each.value.timezone
  title              = each.value.title
  user_type          = each.value.user_type

  name {
    family_name      = each.value.name.family_name
    given_name       = each.value.name.given_name
    formatted        = each.value.name.formatted
    honorific_prefix = each.value.name.honorific_prefix
    honorific_suffix = each.value.name.honorific_suffix
    middle_name      = each.value.name.middle_name
  }

  dynamic "addresses" {
    for_each = each.value.addresses != null ? toset([each.value.addresses]) : toset([])
    content {
      country        = addresses.value.country
      formatted      = addresses.value.formatted
      locality       = addresses.value.locality
      postal_code    = addresses.value.postal_code
      primary        = addresses.value.primary
      region         = addresses.value.region
      street_address = addresses.value.street_address
      type           = addresses.value.type
    }
  }

  dynamic "emails" {
    for_each = each.value.emails != null ? toset([each.value.emails]) : toset([])
    content {
      primary = emails.value.primary
      type    = emails.value.type
      value   = emails.value.value
    }
  }

  dynamic "phone_numbers" {
    for_each = each.value.phone_numbers != null ? toset([each.value.phone_numbers]) : toset([])
    content {
      primary = phone_numbers.value.primary
      type    = phone_numbers.value.type
      value   = phone_numbers.value.value
    }
  }
}
