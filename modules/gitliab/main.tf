module "group" {
  source = "./modules/group"

  group = var.group
}

module "projects" {
  for_each = { for repo in var.group.repositories : repo.name => repo }
  source   = "./modules/project"

  group_id     = module.group.id
  description  = each.value.description
  name         = each.key
  team_members = each.value.team_members
}
