variable "users" {
  type = list(object({
    display_name       = optional(string) # The name that is typically displayed when the user is referenced.
    user_name          = string           # A unique string used to identify the user. This value can consist of letters, accented characters, symbols, numbers, and punctuation.
    locale             = optional(string) # The user's geographical region or location.
    nickname           = optional(string) # An alternate name for the user.
    preferred_language = optional(string) # The preferred language of the user.
    profile_url        = optional(string) # An URL that may be associated with the user.
    timezone           = optional(string) # The user's time zone.
    title              = optional(string) # The user's title.
    user_type          = optional(string) # The user type.
    name = object({                       # Details about the user's full name.
      family_name      = string           # The family name of the user.
      given_name       = string           # The given name of the user.
      formatted        = optional(string) # The name that is typically displayed when the name is shown for display.
      honorific_prefix = optional(string) # The honorific prefix of the user.
      honorific_suffix = optional(string) # The honorific suffix of the user.
      middle_name      = optional(string) # The middle name of the user.
    })
    addresses = optional(object({       # Details about the user's address. At most 1 address is allowed.
      country        = optional(string) # The country that this address is in.
      formatted      = optional(string) # The name that is typically displayed when the address is shown for display.
      locality       = optional(string) # The address locality.
      postal_code    = optional(string) # The postal code of the address.
      primary        = optional(bool)   # When true, this is the primary address associated with the user.
      region         = optional(string) # The region of the address.
      street_address = optional(string) # The street of the address.
      type           = optional(string) # The type of address.
    }))
    emails = optional(object({
      primary = optional(bool)   # When true, this is the primary address associated with the user.
      type    = optional(string) # The type of address.
      value   = optional(string) # The email address. This value must be unique across the identity store.
    }))
    phone_numbers = optional(object({
      primary = optional(bool)   # When true, this is the primary phone number associated with the user.
      type    = optional(string) # The type of phone number.
      value   = optional(string) # The phone number.
    }))
  }))
  description = "List of User resources within an Identity Store."
  default = [{
    display_name      = null,
    identity_store_id = null,
    user_name         = null,
    name              = { family_name = null, given_name = null }
  }]
}
