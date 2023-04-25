resource "aws_security_group" "sg" {
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  name        = "${data.terraform_remote_state.vpc.outputs.tags}-sg"
  description = "SG NAME"

  ingress {
    description      = "SSH from My IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["211.206.114.80/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    NAME = "${data.terraform_remote_state.vpc.outputs.tags}-sg"
  }
}
