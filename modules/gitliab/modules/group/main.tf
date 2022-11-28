data "gitlab_group" "parent_group" {
  count = local.has_existed_parent

  group_id = var.group.parent.id
}

resource "gitlab_group" "parent_group" {
  count            = local.has_non_existed_parent
  name             = var.group.parent.name
  path             = var.group.parent.path
  description      = var.group.parent.description
  parent_id        = var.group.parent.parent_id
  visibility_level = var.group.parent.visibility_level
}

locals {
  has_existed_parent     = var.group.parent == null ? 0 : var.group.parent.id != null ? 1 : 0
  has_non_existed_parent = var.group.parent == null ? 0 : var.group.parent.id == null ? 1 : 0
  group_parent_id        = var.group.parent == null ? null : var.group.parent.id != null ? data.gitlab_group.parent_group[0].id : gitlab_group.parent_group[0].id
}

resource "gitlab_group" "this" {
  name                      = var.group.name
  path                      = var.group.path
  description               = var.group.description
  visibility_level          = "public"
  default_branch_protection = 2
  parent_id                 = local.group_parent_id
}

resource "gitlab_project" "README" {
  name             = "README"
  description      = "Overview of ${var.group.name} Group"
  default_branch   = "main"
  namespace_id     = gitlab_group.this.id
  visibility_level = "public"
}

resource "gitlab_project" "infra" {
  name             = "terraform-infra"
  default_branch   = "main"
  namespace_id     = gitlab_group.this.id
  visibility_level = "public"
}
