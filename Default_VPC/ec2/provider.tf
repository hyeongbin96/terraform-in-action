provider "aws" {
   region = "ap-northeast-2"
   shared_credentials_files = [ "~/.aws/credentials" ]
   profile = "histdc-dev-terraform"
}

terraform {
  backend "s3" {
    bucket = "terraform-hb-backend"
    key    = "vpc/ec2.tfstate"
    region = "ap-northeast-2"
    profile = "histdc-dev-terraform"
    # dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
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