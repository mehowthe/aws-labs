terraform {
  backend "local" {
    path = "backend/terraform.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
