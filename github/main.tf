module "repo-creator" {
  for_each     = var.repos
  config       = each.value.config
  description  = each.value.description
  organisation = var.organisation
  repo_name    = each.key
  source       = "./modules/repo-creator"
}


output "repo_clone_urls" {
  value = { for repo in sort(keys(var.repos)) : repo => module.repo-creator[repo].repo_url }
}


