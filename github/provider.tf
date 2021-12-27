terraform {
  required_version = ">= 1.1.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }

    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

provider "github" {
  token = var.GITHUB_TOKEN
}
