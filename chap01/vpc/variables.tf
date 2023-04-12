variable "tags" {
    type = string
    default = "hist-hb"
    description = "Additinal your company and name tags"
}

variable "aws_az" {
    type = list
    default = ["ap-northeast-2a", "ap-northeast-2c"]  
}

variable "aws_az_des" {
    type = list
    default = ["2a", "2c"]  
}

variable "vpc_cidr" {
    type = string
    default = "10.172.0.0/16"
    description = "aws vpc cidr"
}

variable "public_subnet" {
    type = list
    default = ["10.172.10.0/24", "10.172.20.0/24"]
    description = "aws public subnet cidr"  
}

variable "private_subnet" {
    type = list
    default = ["10.172.30.0/24", "10.172.40.0/24"]
    description = "aws private subnet cidr" 
}
