terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
         }
  }
    backend "s3" {
    bucket = "terralearn"
    key    = "tfstate/terralearn.tfstate"
    region = "eu-west-3"
  }
}

provider "aws" {
  region = "eu-west-3"
  access_key = "****************"
  secret_key = "****************"
}