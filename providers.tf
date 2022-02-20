terraform {
  required_version = "~> 1.0"
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "3.61"
      }
  }
}
provider "aws" {
   region = "us-west-2"
   profile = "default"
}
terraform {
  backend "s3" {
    bucket = "mytfstate-devop"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}
