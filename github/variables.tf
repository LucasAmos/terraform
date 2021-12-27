variable "GITHUB_TOKEN" {
  description = "GitHub Personal Access Token"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile"
}
variable "aws_region" {
  type        = string
  description = "aws region"
}

variable "default_tags" {
  type = object({
    Owner       = string
    Environment = string
  })
  default = {
    Owner       = "Lucas"
    Environment = "Dev"
  }
}

variable "organisation" {
}

variable "repos" {
}



