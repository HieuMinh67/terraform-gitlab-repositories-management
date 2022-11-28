variable "gitlab_token" {
  type        = string
  description = "Personal access token that has privilege to create repositories and groups"
}

variable "gitlab_host" {
  type = string
}

variable "groups" {
  type = list(object({
    name = string
    parent = optional(object({
      id               = optional(string)
      name             = optional(string)
      parent_id        = optional(string)
      path             = optional(string)
      name             = optional(string)
      description      = optional(string)
      visibility_level = optional(string)
    }))
    description = string
    path        = string
    visibility  = string
    repositories = list(object({
      name         = string
      description  = string
      team_members = map(list(string))
    }))
  }))
}