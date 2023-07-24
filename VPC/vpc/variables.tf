variable "tags" {
    type = string
    default = "HB"
    description = "Additinal your company and name tags"
}

variable "aws_az" {
    type = list
    default = ["ap-northeast-2a", "ap-northeast-2c"]  
}

variable "aws_az_des" {
    type = list
    default = ["2A", "2C"]  
}

variable "vpc_cidr" {
    type = string
    default = "10.172.0.0/16"
    description = "vpc cidr"
}

variable "public_subnet" {
    type = list
    default = ["10.172.10.0/24", "10.172.20.0/24"]
    description = "public subnet cidr"  
}

variable "web_subnet" {
    type = list
    default = ["10.172.30.0/24", "10.172.40.0/24"]
    description = "app subnet cidr" 
}

variable "db_subnet" {
    type = list
    default = ["10.172.50.0/24", "10.172.60.0/24"]
    description = "database subnet cidr" 
}
