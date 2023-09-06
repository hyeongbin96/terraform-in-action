resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
  domain = "vpc"  //not use vpc = true

  tags = {
    Name = "${data.terraform_remote_state.vpc.outputs.tags}-bastion-eip"
  }
}

# EC2 instance resource 
# bastion
resource "aws_instance" "bastion" {
  ami = "ami-0676d41f079015f32"
  instance_type = "t3.medium"
  key_name = "hbjeon"
  subnet_id = data.terraform_remote_state.vpc.outputs.public_subnet_id[0]
  vpc_security_group_ids = [aws_security_group.sg.id]

  root_block_device {
    volume_size = "50"
    volume_type = "gp3"
  }

  tags = {
    Name = "${data.terraform_remote_state.vpc.outputs.tags}-bastion"
  }
}

# web-ec2-2a
resource "aws_instance" "web-2a" {
  ami = "ami-0676d41f079015f32"
  instance_type = "t3.medium"
  key_name = "hbjeon"
  subnet_id = data.terraform_remote_state.vpc.outputs.web_subnet_id[0]
  vpc_security_group_ids = [aws_security_group.sg.id]

  root_block_device {
    volume_size = "50"
    volume_type = "gp3"
  }

  tags = {
    Name = "${data.terraform_remote_state.vpc.outputs.tags}-web-2a"
  }
}

# web-ec2-2c
resource "aws_instance" "web-2c" {
  ami = "ami-0676d41f079015f32"
  instance_type = "t3.medium"
  key_name = "hbjeon"
  subnet_id = data.terraform_remote_state.vpc.outputs.web_subnet_id[1]
  vpc_security_group_ids = [aws_security_group.sg.id]

  root_block_device {
    volume_size = "50"
    volume_type = "gp3"
  }

  tags = {
    Name = "${data.terraform_remote_state.vpc.outputs.tags}-web-2c"
  }
}