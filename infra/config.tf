terraform {
  required_version = ">= 0.13.0"
  required_providers {
    aws = ">= 3.0"
  }
}

provider "aws" {
  region = "eu-west-1"
}