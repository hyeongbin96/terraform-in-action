variable "tags" {
    type = string
    default = "hist-hb"
    description = "Additinal your company and name tags"
}

variable "aws_az" {
    type = list
    default = ["ap-northeast-2a", "ap-northeast-2c"]  
}

variable "vpc_cidr" {
    type = string
    default = "172.0.0.0/16"
    description = "aws vpc cidr"
}

variable "public_subnet" {
    type = list
    default = ["172.0.10.0", "172.0.20.0"]
    description = "aws public subnet cidr"  
}

variable "private_subnet" {
    type = list
    default = ["172.0.30.0", "172.0.40.0"]
    description = "aws private subnet cidr" 
}
