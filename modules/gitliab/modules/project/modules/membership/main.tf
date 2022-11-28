data "gitlab_user" "this" {
  count = length(var.members)

  username = var.members[count.index]
}

resource "gitlab_project_membership" "this" {
  depends_on = [data.gitlab_user.this]
  count      = length(data.gitlab_user.this)

  access_level = var.role
  user_id      = data.gitlab_user.this[count.index].id
  project_id   = var.project_id
}
