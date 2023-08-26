variable "groups" {
  type = list(object({
    display_name = string                 # (Forces replacement) A string containing the name of the group. This value is commonly displayed when the group is referenced.
    description  = optional(string)       # A string containing the description of the group.
    group_id     = optional(string)       # Group ID used in group membership.
    members      = optional(list(string)) # List of members usernames
  }))
  description = "List of Group resources within an Identity Store."
  default     = [{ display_name = null }]
}
