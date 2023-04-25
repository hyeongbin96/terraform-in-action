provider "aws" {
   region = "ap-northeast-2"
   shared_credentials_files = [ "~/.aws/credentials" ]
   profile = "histdc-dev-terraform"
}

terraform {
  backend "s3" {
    bucket = "terraform-hb-backend"
    key    = "chap01-vpc.tfstate"
    region = "ap-northeast-2"
    profile = "histdc-dev-terraform"
    # dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}