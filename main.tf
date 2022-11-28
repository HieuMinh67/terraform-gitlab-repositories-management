module "team" {
  source = "./modules/gitliab"

  for_each = { for group in var.groups : group.name => group }

  group = each.value

}