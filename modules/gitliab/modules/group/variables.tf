#variable "name" {
#  type        = string
#  description = "Group name"
#}
#
#variable "description" {
#  type    = string
#  default = null
#}
#
#variable "path" {
#  type    = string
#  default = "services"
#}
#
#variable "visibility" {
#  type        = string
#  default     = "public"
#  description = "The group's visibility. Can be private, internal, or public"
#}
#
#variable "parent_group" {
#  type    = string
#  default = "5"
#}
#
#variable "team_members" {
#  type = set(object({
#    username = string
#    role     = string
#  }))
#  default = [{
#    username = "root"
#    role     = "owner"
#  }]
#}
variable "group" {
  type = any
}