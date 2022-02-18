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
