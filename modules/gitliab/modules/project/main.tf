resource "gitlab_project" "this" {
  name             = var.name
  description      = var.description
  default_branch   = "main"
  namespace_id     = var.group_id
  visibility_level = "public"
}

module "team_members" {
  for_each = var.team_members

  source = "./modules/membership"

  project_id = gitlab_project.this.id
  role       = each.key
  members    = each.value
}