resource "aws_security_group" "bastion_sg" {
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  name        = "${data.terraform_remote_state.vpc.outputs.tags}-bastion-sg"
  description = "Bastion SG"

  ingress {
    description      = "SSH from My IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["58.127.14.207/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "ICMP"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

  tags = {
    NAME = "${data.terraform_remote_state.vpc.outputs.tags}-bastion-sg"
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  name        = "${data.terraform_remote_state.vpc.outputs.tags}-web-sg"
  description = "SG NAME"

  ingress {
    description      = "SSH from Bastion"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "ICMP"
    cidr_blocks      = ["0.0.0.0/0"]
  } 

  tags = {
    NAME = "${data.terraform_remote_state.vpc.outputs.tags}-web-sg"
  }
}
