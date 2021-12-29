terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}


resource "github_repository_project" "project" {
  for_each   = var.projects
  name       = each.key
  repository = var.repo_name
  body       = each.value
}
