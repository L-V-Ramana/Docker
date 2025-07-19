data "aws_ami" "joindevops" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "root-device-type"
    values = ["EBS"]
  }     

  owners = ["973714476881"] 
}

