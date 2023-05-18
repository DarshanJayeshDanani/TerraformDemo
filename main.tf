terraform {
  required_version = "~>1.1"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.67.0"
    }
    random = {
        source = "hashicorp/random"
        version = "3.4.3"
    }
  }
  backend "s3" {
      bucket = "udemytrainingbucketterraformstatestorage"
      key = "terraform.tfstate"
      region = "us-east-1"
      profile = "udemyterraformtraining"

      dynamodb_table = "udemyterraformtrainingstatelocking"
  }
}

provider "aws" {
    profile = "udemyterraformtraining"
    region = "us-east-1"
}