variable "name" {
  type = string
}

variable "group_id" {
  type = string
}

variable "description" {
  type = string
}

variable "team_members" {
  type = map(list(string))
}