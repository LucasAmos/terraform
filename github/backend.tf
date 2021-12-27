terraform {
  backend "s3" {
    bucket         = "lucas-terraform-backend"
    encrypt        = true
    key            = "remote-backend.tfstate" # the path to the terraform.tfstate file stored inside the bucket
    region         = "eu-west-1"
    dynamodb_table = "lucas-terraform-backend"
    profile        = "lucas"
  }
}
