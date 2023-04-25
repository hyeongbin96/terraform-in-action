# EC2 Network interface
resource "aws_network_interface" "network_interface" {
  subnet_id = "${data.terraform_remote_state.vpc.outputs.subnet_id[0]}"
  private_ips = ["10.172.10.114"]
  security_groups = [aws_security_group.sg.id]

  tags = {
    Name = "${data.terraform_remote_state.vpc.outputs.tags}-network-interface"
  }
}

resource "aws_eip" "ec2_eip" {
  instance = aws_instance.ec2.id
  vpc = true
}

# EC2 instance resource 
resource "aws_instance" "ec2" {
  ami = "ami-0676d41f079015f32"
  instance_type = "t3.medium"
  key_name = "hbjeon"

  network_interface {
    network_interface_id = aws_network_interface.network_interface.id
    device_index = 0
  }

  root_block_device {
    volume_size = "100"
    volume_type = "gp3"
  }

  tags = {
    Name = "${data.terraform_remote_state.vpc.outputs.tags}-ec2"
  }
}