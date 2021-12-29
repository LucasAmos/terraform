module "github-repository" {
  for_each     = var.repos
  config       = each.value.config
  description  = each.value.description
  organisation = var.organisation
  repo_name    = each.key
  source       = "./modules/github-repository"
}


output "repo_clone_urls" {
  value = { for repo in keys(var.repos) : repo => module.github-repository[repo].repo_url }
}


