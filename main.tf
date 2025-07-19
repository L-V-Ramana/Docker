resource "aws_instance" "main"{
    ami    =  local.ami
    instance_type = "t3.medium"
    vpc_security_group_ids = [aws_security_group.allow_all_docker.id]

     root_block_device {
    volume_size = 50
    volume_type = "gp3" # or "gp2", depending on your preference
  }
    user_data = file("docker.sh")

  tags = local.common_tags
}

resource "aws_security_group" "allow_all_docker" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = local.common_tags
}