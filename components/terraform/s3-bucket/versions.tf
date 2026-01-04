terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

# Configure the AWS provider using the region variable
provider "aws" {
  region = var.region
}

# Additional variables passed by Atmos from stack config
variable "region" {
  description = "AWS region"
  type        = string
}

variable "stage" {
  description = "Stage name (e.g., dev, prod)"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}