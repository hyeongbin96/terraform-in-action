terraform {
  backend "s3" {
    bucket = "terraform-hb-backend"
    key    = "vpc.tfstate"
    region = "ap-northeast-2"
    profile = "histdc-dev-terraform"
    # dynamodb_table = "terraform-locks"
    # encrypt        = true
  }
}