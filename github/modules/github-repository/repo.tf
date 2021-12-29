terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

locals {
  default_branch = var.config.default-branch
  gitignore      = var.config.gitignore
  has_projects   = length(keys(var.config.projects)) == 0 ? false : true
  projects       = var.config.projects
}

resource "github_repository" "repo" {
  auto_init    = true
  description  = var.description
  has_projects = local.has_projects
  name         = var.repo_name
  visibility   = "private"
}


resource "github_branch" "default" {
  repository = github_repository.repo.name
  branch     = local.default_branch
}

resource "github_branch_default" "default" {
  repository = github_repository.repo.name
  branch     = github_branch.default.branch
}

module "github-project" {
  count  = local.has_projects ? 1 : 0
  source = "../github-project"

  repo_name = github_repository.repo.name
  projects  = var.config.projects
}


resource "github_repository_file" "pr_template" {
  count          = local.gitignore ? 1 : 0
  repository     = github_repository.repo.name
  branch         = local.default_branch
  file           = ".gitignore"
  content        = "**/*.tfstate"
  commit_message = "Gitignore file"
  commit_author  = "Lucas Amos"
  commit_email   = "lucas@lucasamos.dev"

  depends_on = [
    github_branch.default
  ]

  lifecycle {
    ignore_changes = [
      content
    ]
  }
}

output "repo_url" {
  value = github_repository.repo.ssh_clone_url
}
