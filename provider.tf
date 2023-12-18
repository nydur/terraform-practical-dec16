# Start of block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0" // best practice to specify version
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
# End of block