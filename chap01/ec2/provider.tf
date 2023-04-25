terraform {
  required_version = ">= 0.14"
}

provider "aws" {
   region = "ap-northeast-2"
   shared_credentials_files = [ "~/.aws/credentials" ]
   profile = "histdc-dev-terraform"
}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket = "terraform-hb-backend"
        key    = "chap01-vpc.tfstate"
        region = "ap-northeast-2"
        profile = "histdc-dev-terraform"
    }
}