provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  backend "s3" {
    bucket = "gitops-terraform"
    key = "./terraform.tfstate"
    region = "ap-northeast-2"
    encrypt = true
    dynamodb_table = "terraform_lock"
  }
}